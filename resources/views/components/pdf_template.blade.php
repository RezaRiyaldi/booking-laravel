<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid black;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            text-align: center;
        }

        .image {
            max-width: 200px;
            height: auto;
        }
    </style>
</head>

<body>
    <table>
        <tr>
            <th>Applicant Name</th>
            <td>{{ $booking->applicant_name }}</td>
            <th>Passanger Name</th>
            <td>{{ $booking->passenger_name }}</td>
            <th rowspan="2">Vehicle</th>
            <td rowspan="2">{{ $booking->cars->name }}</td>
        </tr>
        <tr>
            <th>Phone Number</th>
            <td>{{ $booking->applicant_phone }}</td>
            <th>Passanger Phone</th>
            <td>{{ $booking->passenger_phone }}</td>
        </tr>
        <tr>
            <th rowspan="2">Dept./Bagian</th>
            <td rowspan="2">{{ $booking->dept }}</td>
            <th colspan="4">Car Usage</th>
        </tr>
        <tr>
            <td colspan="4">{{ $booking->is_overtime ? 'Car for work overtime' : 'Car for non-work overtime' }}</td>
        </tr>
        <tr>
            <th colspan="6">Waktu Penggunaan</th>
        </tr>
        <tr>
            <th></th>
            <th>Hari</th>
            <th colspan="2">Tanggal</th>
            <th colspan="2">Waktu</th>
        </tr>
        <tr>
            <th>Mulai</th>
            <td>{{ date('l', strtotime($booking->start_time)) }}</td>
            <td colspan="2">{{ date('d F Y', strtotime($booking->start_time)) }}</td>
            <td colspan="2">{{ date('H:i', strtotime($booking->start_time)) }}</td>
        </tr>
        <tr>
            <th>Selesai</th>
            <td>{{ date('l', strtotime($booking->end_time)) }}</td>
            <td colspan="2">{{ date('d F Y', strtotime($booking->end_time)) }}</td>
            <td colspan="2">{{ date('H:i', strtotime($booking->end_time)) }}</td>
        </tr>
        <tr>
            <th>Tujuan</th>
            <td colspan="2">{{ $booking->destination }}</td>
            <th>Keperluan</th>
            <td colspan="2">{{ $booking->purpose }}</td>
        </tr>
        <tr>
            <th colspan="3">Diajukan oleh,</th>
            <th colspan="3">Disetujui oleh,</th>
        </tr>
        <tr>
            <td colspan="3" style="height: 50px">{{ $booking->user->name }}</td>
            <td colspan="3">{{ $booking->approver->name }}</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: right"><small><i>User</i></small></td>
            <td colspan="3" style="text-align: right"><small><i>Manager</i></small></td>
        </tr>
    </table>
    {{--
    <h1>Booking Details</h1>

    <p><strong>Booking ID:</strong> {{ $booking->id }}</p>
    <p><strong>User:</strong> {{ $booking->user->name }}</p>
    <p><strong>Date:</strong> {{ $booking->date }}</p>
    <p><strong>Start Time:</strong> {{ $booking->start_time }}</p>
    <p><strong>End Time:</strong> {{ $booking->end_time }}</p>
    <p><strong>Status:</strong> {{ $booking->status }}</p>

    @if ($booking->room)
        <h2>Room Details</h2>
        <p><strong>Room Name:</strong> {{ $booking->room->name }}</p>
        @if ($booking->room->photo)
            <img src="{{ asset('storage/' . $booking->room->photo) }}" alt="Room Photo" class="image">
        @endif
    @endif

    @if ($booking->cars)
        <h2>Car Details</h2>
        <p><strong>Car Name:</strong> {{ $booking->cars->name }}</p>
        <p><strong>Plat Nomor:</strong> {{ $booking->cars->license_plate }}</p>
        <p><strong>Pemohon:</strong> {{ $booking->applicant_name }}</p>
        <p><strong>Telepon Pemohon:</strong> {{ $booking->applicant_phone }}</p>
        <p><strong>Departemen:</strong> {{ $booking->dept }}</p>
        <p><strong>Nama Penumpang:</strong> {{ $booking->passenger_name }}</p>
        <p><strong>Telepon Penumpang:</strong> {{ $booking->passenger_phone }}</p>
        <p><strong>Overtime:</strong> {{ $booking->is_overtime ? 'Yes' : 'No' }}</p>
        <p><strong>Tujuan:</strong> {{ $booking->destination }}</p>
        @if ($booking->cars->photo)
            <img src="{{ asset('storage/' . $booking->cars->photo) }}" alt="Car Photo" class="image">
        @endif
    @endif --}}

</body>

</html>
