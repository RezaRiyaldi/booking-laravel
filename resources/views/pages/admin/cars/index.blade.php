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

    @slot('buttons')
      <a href="{{ route('cars.create') }}" class="btn btn-primary"><i class="fas fa-plus"></i>&nbsp;Tambah Mobil</a>
    @endslot

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
      ajax: '{{ route('cars.json') }}',
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
        render: function ( data, type, row ) {
          var result = row.name;

          var is_touch_device = 'ontouchstart' in window || navigator.msMaxTouchPoints;

          if (is_touch_device) {
            result += '<div>';
          } else {
            result += '<div class="table-links">';
          }

          result += '<a href="cars/'+row.id+'/edit"'
          + ' class="text-primary">Edit</a>'

          + ' <div class="bullet"></div>'

          + ' <a href="javascript:;" data-id="'+row.id+'" '
          + ' data-title="Hapus"'
          + ' data-body="Yakin ingin menghapus ini?"'
          + ' class="text-danger"'
          + ' id="delete-btn"'
          + ' name="delete-btn">Hapus'
          + ' </a>'
          + '</div>';

          return result;

        }
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


    $(document).on('click', '#delete-btn', function() {
      var id    = $(this).data('id');
      var title = $(this).data('title');
      var body  = $(this).data('body');

      $('.modal-title').html(title);
      $('.modal-body').html(body);
      $('#confirm-form').attr('action', 'cars/'+id);
      $('#confirm-form').attr('method', 'POST');
      $('#submit-btn').attr('class', 'btn btn-danger');
      $('#lara-method').attr('value', 'delete');
      $('#confirm-modal').modal('show');
    });

    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });
  });

</script>

@include('includes.lightbox')

@include('includes.notification')

@include('includes.confirm-modal')

@endpush
