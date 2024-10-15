@extends('layouts.main')

@section('title', 'Data Mobil - ROOMING')

@section('header-title', 'Data Mobil')

@section('breadcrumbs')
  <div class="breadcrumb-item"><a href="#">Mobil</a></div>
  <div class="breadcrumb-item active">Data Mobil</div>
@endsection

@section('section-title', 'Mobil')

@section('section-lead')
  Berikut ini adalah daftar seluruh mobil.
@endsection

@section('content')

  @component('components.datatables')

    @slot('table_id', 'cars-table')

    @slot('table_header')
      <tr>
        <th>#</th>
        <th>Foto</th>
        <th>Nama</th>
        <th>Deskripsi</th>
        <th>Plat Nomor</th>
      </tr>
    @endslot

  @endcomponent

@endsection

@push('after-script')

  <script>
  $(document).ready(function() {
    $('#cars-table').DataTable({
      processing: true,
      serverSide: true,
      ajax: '{{ route('cars-list.json') }}',
      order: [2, 'asc'],
      columns: [
      {
        name: 'DT_RowIndex',
        data: 'DT_RowIndex',
        orderable: false,
        searchable: false
      },
      {
        name: 'photo',
        data: 'photo',
        orderable: false,
        searchable: false,
        render: function ( data, type, row ) {
          if(data != null) {
            return `<div class="gallery gallery-fw">`
              + `<a href="{{ asset('storage/${data}') }}" data-toggle="lightbox">`
                + `<img src="{{ asset('storage/${data}') }}" class="img-fluid" style="min-width: 80px; height: auto;">`
              + `</a>`
            + '</div>';
          } else {
            return '-'
          }
        }
      },
      {
        name: 'name',
        data: 'name',
      },
      {
        name: 'description',
        data: 'description',
      },
      {
        name: 'license_plate',
        data: 'license_plate',
      },
    ],
    });

    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });
  });

</script>

@include('includes.lightbox')

@endpush
