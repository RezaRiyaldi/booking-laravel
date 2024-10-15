@extends('layouts.main')

@section('title', 'Booking List - ROOMING')

@section('header-title', 'Booking List')

@section('breadcrumbs')
    <div class="breadcrumb-item"><a href="#">Transaksi</a></div>
    <div class="breadcrumb-item active">Booking List</div>
@endsection

@section('section-title', 'Booking List')

@section('section-lead')
    Berikut ini adalah daftar seluruh booking dari setiap user.
@endsection

@section('content')

    @component('components.datatables')
        @slot('table_id', 'booking-list-table')

        @slot('table_header')
            <tr>
                <th>#</th>
                <th>Detail</th>
                <th>Foto</th>
                <th>Ruangan</th>
                <th>Mobil</th>
                <th>User</th>
                <th>Tanggal</th>
                <th>Waktu Mulai</th>
                <th>Waktu Selesai</th>
                <th>Keperluan</th>
                <th>Status</th>
            </tr>
        @endslot
    @endcomponent

@endsection

@push('after-script')
    <script src="//cdn.datatables.net/plug-ins/1.10.22/dataRender/ellipsis.js"></script>

    <script>
        $(document).ready(function() {
            $('#booking-list-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: '{{ route('booking-list.json') }}',
                columnDefs: [{
                        targets: [4],
                        orderData: [4, 5]
                    },
                    {
                        targets: [5],
                        orderData: [5, 4]
                    },
                    {
                        targets: 7,
                        render: $.fn.dataTable.render.ellipsis(20, true)
                    },
                ],
                order: [
                    [4, 'desc'],
                    [5, 'desc']
                ],
                columns: [{
                        name: 'DT_RowIndex',
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        orderable: false,
                        searchable: false,
                        data: null,
                        render: function(data, type, row) {
                            return row.cars_id != null ?
                                '<button class="btn btn-info btn-sm toggle-details rounded-circle"><i class="fas fa-plus"></i></button>' :
                                '-';
                        }
                    },
                    {
                        name: 'room.photo',
                        data: 'room.photo',
                        orderable: false,
                        searchable: false,
                        render: function(data, type, row) {
                            let photo = data ? data : (row.cars ? row.cars.photo : null);
                            if (photo != null) {
                                return `<div class="gallery gallery-fw">` +
                                    `<a href="{{ asset('storage/${photo}') }}" data-toggle="lightbox">` +
                                    `<img src="{{ asset('storage/${photo}') }}" class="img-fluid" style="min-width: 80px; height: auto;">` +
                                    `</a>` +
                                    '</div>';
                            } else {
                                return '-';
                            }
                        }
                    },
                    {
                        name: 'room.name',
                        data: 'room.name',
                        orderable: false,
                        render: function(data, type, row) {
                            if (data == null) {
                                return '-'
                            }

                            var result = data;

                            var now = new Date();
                            var data_full_time = new Date(row.start_time);

                            var is_touch_device = 'ontouchstart' in window || navigator
                                .msMaxTouchPoints;

                            if (is_touch_device) {
                                result += '<div>';
                            } else {
                                result += '<div class="table-links">';
                            }

                            if (data_full_time > now) {
                                if (row.status === 'PENDING' || row.status === 'DITOLAK') {
                                    result += ' <a href="javascript:;" data-id="' + row.booking_id +
                                        '" ' +
                                        ' data-title="Setujui"' +
                                        ' data-body="Yakin setujui booking ini?"' +
                                        ' data-value="1"' +
                                        ' class="text-primary"' +
                                        ' id="acc-btn"' +
                                        ' name="acc-btn">Setujui' +
                                        ' </a>';
                                }
                            }

                            if (row.status === 'PENDING') {
                                result += '<div class="bullet"></div>';
                            }

                            if (row.status === 'PENDING' || row.status === 'DISETUJUI') {
                                result += ' <a href="javascript:;" data-id="' + row.booking_id +
                                    '" ' +
                                    ' data-title="Tolak"' +
                                    ' data-body="Yakin tolak booking ini?"' +
                                    ' data-value="0"' +
                                    ' class="text-danger"' +
                                    ' id="deny-btn"' +
                                    ' name="deny-btn">Tolak' +
                                    ' </a>'; +
                                '<div class="bullet"></div>';
                            }

                            +
                            '</div>';

                            return result;

                        }
                    },
                    {
                        name: 'cars.name',
                        data: 'cars.name',
                        orderable: false,
                        render: function(data, type, row) {
                            if (data == null) {
                                return '-'
                            }
                            var result = data;

                            var now = new Date();
                            var data_full_time = new Date(row.start_time);

                            var is_touch_device = 'ontouchstart' in window || navigator
                                .msMaxTouchPoints;

                            if (is_touch_device) {
                                result += '<div>';
                            } else {
                                result += '<div class="table-links">';
                            }

                            if (data_full_time > now) {
                                if (row.status === 'PENDING' || row.status === 'DITOLAK') {
                                    result += ' <a href="javascript:;" data-id="' + row.booking_id +
                                        '" ' +
                                        ' data-title="Setujui"' +
                                        ' data-body="Yakin setujui booking ini?"' +
                                        ' data-value="1"' +
                                        ' class="text-primary"' +
                                        ' id="acc-btn"' +
                                        ' name="acc-btn">Setujui' +
                                        ' </a>';
                                }
                            }

                            if (row.status === 'PENDING') {
                                result += '<div class="bullet"></div>';
                            }

                            if (row.status === 'PENDING' || row.status === 'DISETUJUI') {
                                result += ' <a href="javascript:;" data-id="' + row.booking_id +
                                    '" ' +
                                    ' data-title="Tolak"' +
                                    ' data-body="Yakin tolak booking ini?"' +
                                    ' data-value="0"' +
                                    ' class="text-danger"' +
                                    ' id="deny-btn"' +
                                    ' name="deny-btn">Tolak' +
                                    ' </a>'; +
                                '<div class="bullet"></div>';
                            }

                            +
                            '</div>';

                            return result;

                        }
                    },
                    {
                        name: 'user.name',
                        data: 'user.name',
                        orderable: false,
                    },
                    {
                        name: 'date',
                        data: 'date',
                    },
                    {
                        name: 'start_time',
                        data: 'start_time',
                    },
                    {
                        name: 'end_time',
                        data: 'end_time',
                    },
                    {
                        name: 'purpose',
                        data: 'purpose',
                    },
                    {
                        name: 'status',
                        data: 'status',
                        render: function(data, type, row) {
                            var result = `<span class="badge badge-`;

                            if (data === 'PENDING')
                                result += `info`;
                            else if (data === 'DISETUJUI')
                                result += `primary`;
                            else if (data === 'DIGUNAKAN')
                                result += `primary`;
                            else if (data === 'DITOLAK')
                                result += `danger`;
                            else if (data === 'EXPIRED')
                                result += `warning`;
                            else if (data === 'BATAL')
                                result += `warning`;
                            else if (data === 'SELESAI')
                                result += `success`;

                            result += `">${data}</span>`;

                            return result;
                        }
                    },
                ],
            });

            $(document).on('click', '#acc-btn, #deny-btn', function() {
                var id = $(this).data('id');
                var title = $(this).data('title');
                var body = $(this).data('body');
                var value = $(this).data('value');

                var submit_btn_class = (value === 1) ? 'btn btn-primary' : 'btn btn-danger';

                $('.modal-title').html(title);
                $('.modal-body').html(body);
                $('#confirm-form').attr('action', '/admin/booking-list/' + id + '/update/' + value);
                $('#confirm-form').attr('method', 'POST');
                $('#submit-btn').attr('class', submit_btn_class);
                $('#lara-method').attr('value', 'put');
                $('#confirm-modal').modal('show');
            });

            $(document).on('click', '[data-toggle="lightbox"]', function(event) {
                event.preventDefault();
                $(this).ekkoLightbox();
            });

            $('#booking-list-table tbody').on('click', 'button.toggle-details', function() {
                var tr = $(this).closest('tr');
                var row = $('#booking-list-table').DataTable().row(tr);

                if (row.child.isShown()) {
                    row.child.hide();
                    tr.removeClass('shown');
                    $(this).html('<i class="fas fa-plus"></i>');
                } else {
                    row.child(format(row.data())).show();
                    tr.addClass('shown');
                    $(this).html('<i class="fas fa-times"></i>');
                }
            });

            function format(data) {
                return `
                    <div>
                        <strong>Car Details:</strong><br>
                        <strong>Plat Nomor:</strong> ${data.cars.license_plate || '-'}<br>
                        <strong>Pemohon:</strong> ${data.applicant_name || '-'}<br>
                        <strong>Telepon Pemohon:</strong> ${data.applicant_phone || '-'}<br>
                        <strong>Departemen:</strong> ${data.dept || '-'}<br>
                        <strong>Nama Penumpang:</strong> ${data.passenger_name || '-'}<br>
                        <strong>Telepon Penumpang:</strong> ${data.passenger_phone || '-'}<br>
                        <strong>Overtime:</strong> ${data.is_overtime ? 'Yes' : 'No'}<br>
                        <strong>Tujuan:</strong> ${data.destination || '-'}<br>
                    </div>
                `;
            }
        });
    </script>

    @include('includes.lightbox')

    @include('includes.notification')

    @include('includes.confirm-modal')
@endpush
