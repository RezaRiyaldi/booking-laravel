<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Cars;

use App\Http\Requests\Admin\CarsRequest;

use DataTables;

class CarsController extends Controller
{
    public function json(){
        $data = Cars::all();

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
        return view('pages.admin.cars.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('pages.admin.cars.edit_or_create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CarsRequest $request)
    {
        $data = $request->all();

        if(isset($data['photo'])){
            $data['photo']          = $request->file('photo')->store(
                'assets/image/cars', 'public'
            );
        }

        $create_cars = Cars::create($data);

        if($create_cars) {
            $request->session()->flash('alert-success', 'Mobil '.$data['name'].' berhasil ditambahkan');
        } else {
            $request->session()->flash('alert-failed', 'Mobil '.$data['name'].' gagal ditambahkan');
        }

        return redirect()->route('cars.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item = Cars::findOrFail($id);

        return view('pages.admin.cars.edit_or_create', [
            'item'  => $item
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CarsRequest $request, $id)
    {
        $data = $request->all();

        if(isset($data['photo'])){
            $data['photo']          = $request->file('photo')->store(
                'assets/image/cars', 'public'
            );
        }

        $item = Cars::findOrFail($id);

        if($item->update($data)) {
            $request->session()->flash('alert-success', 'Mobil '.$item->name.' berhasil diupdate');
        } else {
            $request->session()->flash('alert-failed', 'Mobil '.$item->name.' gagal diupdate');
        }

        return redirect()->route('cars.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = Cars::findOrFail($id);

        if($item->delete()) {
            session()->flash('alert-success', 'Mobil '.$item->name.' berhasil dihapus!');
        } else {
            session()->flash('alert-failed', 'Mobil '.$item->name.' gagal dihapus');
        }

        return redirect()->route('cars.index');
    }
}
