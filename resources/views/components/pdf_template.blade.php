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
        }

        .image {
            max-width: 200px;
            height: auto;
        }
    </style>
</head>

<body>

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
            {{-- <img src="{{ asset('storage/' . $booking->room->photo) }}" alt="Room Photo" class="image"> --}}
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
            {{-- <img src="{{ asset('storage/' . $booking->cars->photo) }}" alt="Car Photo" class="image"> --}}
        @endif
    @endif

</body>

</html>
