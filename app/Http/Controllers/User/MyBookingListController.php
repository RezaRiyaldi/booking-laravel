<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;

use App\Models\BookingList;
use App\Models\Room;
use App\Models\RoomStatus;
use App\Models\User;

use App\Jobs\SendEmail;

use App\Http\Requests\User\MyBookingListRequest;
use App\Models\Cars;
use DataTables;

class MyBookingListController extends Controller
{
    public function json()
    {
        $data = BookingList::where('user_id', Auth::user()->id)->with([
            'room',
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
        return view('pages.user.my-booking-list.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $rooms = Room::orderBy('name')->get();

        return view('pages.user.my-booking-list.create', [
            'rooms' => $rooms,
        ]);
    }
    public function create_cars()
    {
        $cars = Cars::orderBy('name')->get();

        return view('pages.user.my-booking-list.create-cars', [
            'cars' => $cars,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(MyBookingListRequest $request, $type = 'room')
    {
        $data               = $request->all();
        $data['user_id']    = Auth::user()->id;
        $data['status']     = 'PENDING';

        $vehicleType = ($type === 'cars') ? 'cars_id' : 'room_id';
        $vehicleModel = ($type === 'cars') ? Cars::class : Room::class;
        $vehicle = $vehicleModel::select('name')->where('id', $data[$vehicleType])->firstOrFail();

        $isAvailable = BookingList::where([
            ['date', '=', $data['date']],
            [$vehicleType, '=', $data[$vehicleType]],
            ['status', '=', 'DISETUJUI']
        ])
            ->where(function ($query) use ($data) {
                $query->whereBetween('start_time', [$data['start_time'], $data['end_time']])
                    ->orWhereBetween('end_time', [$data['start_time'], $data['end_time']])
                    ->orWhere([
                        ['start_time', '<=', $data['start_time']],
                        ['end_time', '>=', $data['end_time']]
                    ]);
            })
            ->count() <= 0;

        if ($isAvailable) {
            if (BookingList::create($data)) {
                $request->session()->flash('alert-success', "Booking {$vehicle->name} berhasil ditambahkan");

                $this->sendEmails($data, $vehicle->name, $type);
            } else {
                $request->session()->flash('alert-failed', "Booking {$vehicle->name} gagal ditambahkan");
                return redirect()->route("my-booking-list.create-$type");
            }
        } else {
            $request->session()->flash('alert-failed', "{$vehicle->name} di waktu itu sudah dibooking");
            return redirect()->route("my-booking-list.create-$type");
        }

        return redirect()->route('my-booking-list.index');
    }

    private function sendEmails($data, $vehicleName, $type)
    {
        $user_name  = $this->getUserName();
        $user_email = $this->getUserEmail();
        $admin      = $this->getAdminData();
        $status     = 'DIBUAT';

        dispatch(new SendEmail($user_email, $user_name, $vehicleName, $data['date'], $data['start_time'], $data['end_time'], $data['purpose'], 'USER', $user_name, 'https://google.com', $status));
        dispatch(new SendEmail($admin->email, $user_name, $vehicleName, $data['date'], $data['start_time'], $data['end_time'], $data['purpose'], 'ADMIN', $admin->name, 'https://google.com', $status));
    }

    /**
     * Cancel the specified data.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function cancel($id)
    {
        $type = 'room';
        $item           = BookingList::findOrFail($id);
        $data['status'] = 'BATAL';


        if ($item->cars_id != NULL) {
            $type = 'cars';
        }

        $vehicleModel = ($type === 'cars') ? Cars::class : Room::class;
        $vehicleType = ($type === 'cars') ? 'cars_id' : 'room_id';
        $vehicle = $vehicleModel::select('name')->where('id', $item->{$vehicleType})->firstOrFail();

        if ($item->update($data)) {
            session()->flash('alert-success', 'Booking ' . $vehicle->name . ' berhasil dibatalkan');

            $user_name          = $this->getUserName();
            $user_email         = $this->getUserEmail();

            $admin      = $this->getAdminData();
            $status     = $data['status'];

            $to_role    = 'USER';

            dispatch(new SendEmail($user_email, $user_name, $vehicle->name, $item->date, $item->start_time, $item->end_time, $item->purpose, $to_role, $user_name, 'https://google.com', $status));

            $to_role    = 'ADMIN';

            dispatch(new SendEmail($admin->email, $user_name, $vehicle->name, $item->date, $item->start_time, $item->end_time, $item->purpose, $to_role, $admin->name, 'https://google.com', $status));
        } else {
            session()->flash('alert-failed', 'Booking ' . $vehicle->name . ' gagal dibatalkan');
        }

        return redirect()->route('my-booking-list.index');
    }

    public function getAdminData()
    {
        return User::select('name', 'email')->where('role', 'ADMIN')->firstOrFail();
    }

    public function getUserName()
    {
        return Auth::user()->name;
    }

    public function getUserEmail()
    {
        return Auth::user()->email;
    }
}
