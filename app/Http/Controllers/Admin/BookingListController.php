<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;

use App\Models\BookingList;
use App\Models\User;

use App\Jobs\SendEmail;
use App\Models\Cars;
use App\Models\Room;
use Barryvdh\DomPDF\PDF;
use DataTables;
use Carbon\Carbon;

class BookingListController extends Controller
{
    public function json()
    {
        $data = BookingList::with([
            'room',
            'user',
            'cars'
        ])
            ->select('*', 'booking_lists.id as booking_id')
            ->get();

        return DataTables::of($data)
            ->addIndexColumn()
            ->make(true);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('pages.admin.booking-list.index');
    }

    public function update($id, $value)
    {
        $item = BookingList::findOrFail($id);
        $today = Carbon::today()->toDateString();
        $now = Carbon::now()->toTimeString();

        $user_name = $item->user->name;
        $user_email = $item->user->email;

        $admin_name = Auth::user()->name;
        $admin_email = Auth::user()->email;

        $type = $item->cars_id !== null ? 'cars' : 'room';
        $vehicleModel = $type === 'cars' ? Cars::class : Room::class;
        $vehicleType = $type === 'cars' ? 'cars_id' : 'room_id';
        $vehicle = $vehicleModel::select('name')->where('id', $item->{$vehicleType})->firstOrFail();

        $isAvailable = BookingList::where([
            ['date', '=', $item['date']],
            [$vehicleType, '=', $item[$vehicleType]],
            ['status', '=', 'DISETUJUI']
        ])
            ->where(function ($query) use ($item) {
                $query->whereBetween('start_time', [$item['start_time'], $item['end_time']])
                    ->orWhereBetween('end_time', [$item['start_time'], $item['end_time']])
                    ->orWhere([
                        ['start_time', '<=', $item['start_time']],
                        ['end_time', '>=', $item['end_time']]
                    ]);
            })
            ->count() <= 0;

        $data = [];
        if ($value == 1) {
            $data['status'] = 'DISETUJUI';
        } elseif ($value == 0) {
            $data['status'] = 'DITOLAK';
        } else {
            session()->flash('alert-failed', 'Perintah tidak dimengerti');
            return redirect()->route('booking-list.index');
        }

        $data['approved_by'] = Auth::user()->id;
        $data['approval_date'] = date('Y-m-d H:i:s');

        if ($item['date'] > $today || ($item['date'] == $today && $item['start_time'] > $now)) {
            if ($data['status'] == 'DISETUJUI') {
                if ($isAvailable) {
                    if ($item->update($data)) {
                        session()->flash('alert-success', 'Booking ' . $item->{$type}->name . ' sekarang ' . $data['status']);
                        $this->sendEmailNotifications($user_email, $user_name, $admin_email, $admin_name, $item, $type, $data['status']);
                    } else {
                        session()->flash('alert-failed', 'Booking ' . $item->{$type}->name . ' gagal diupdate');
                    }
                } else {
                    session()->flash('alert-failed', strtoupper($type) . ' ' . $item->{$type}->name . ' di waktu itu sudah dibooking');
                }
            } elseif ($data['status'] == 'DITOLAK') {
                if ($item->update($data)) {
                    session()->flash('alert-success', 'Booking ' . $item->{$type}->name . ' sekarang ' . $data['status']);
                    $this->sendEmailNotifications($user_email, $user_name, $admin_email, $admin_name, $item, $type, $data['status']);
                } else {
                    session()->flash('alert-failed', 'Booking ' . $item->{$type}->name . ' gagal diupdate');
                }
            }
        } else {
            session()->flash('alert-failed', 'Permintaan booking itu tidak lagi bisa diupdate');
        }

        return redirect()->route('booking-list.index');
    }

    private function sendEmailNotifications($user_email, $user_name, $admin_email, $admin_name, $item, $type, $status)
    {
        dispatch(new SendEmail($user_email, $user_name, $item->{$type}->name, $item['date'], $item['start_time'], $item['end_time'], $item['purpose'], 'USER', $user_name, 'https://google.com', $status));
        dispatch(new SendEmail($admin_email, $user_name, $item->{$type}->name, $item['date'], $item['start_time'], $item['end_time'], $item['purpose'], 'ADMIN', $admin_name, 'https://google.com', $status));
    }

    public function exportPdf($id, PDF $pdf)
    {
        $booking = BookingList::with(['room', 'cars', 'user', 'approver'])->findOrFail($id);

        // dd($booking, $booking->passenger_phone);
        // Load the PDF template with data
        $pdf = $pdf->loadView('components.pdf_template', compact('booking'))
            ->setPaper('a4', 'landscape');;

        // Return the generated PDF as a download
        return $pdf->download('booking_details_' . $booking->id . '.pdf');
    }
}
