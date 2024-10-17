<div class="main-sidebar">
  <aside id="sidebar-wrapper">
    <div class="sidebar-brand">
      <a href="/">ROOMING</a>
    </div>
    <div class="sidebar-brand sidebar-brand-sm">
      <a href="/">RM</a>
    </div>
    <ul class="sidebar-menu">
      @if (in_array(Auth::user()->role, ['USER', 'MANAGER']))
        <li class="menu-header">Dashboard @if (Auth::user()->role == 'MANAGER') User @endif</li>
        <li><a class="nav-link" href="{{ route('user.dashboard') }}"><i class="fas fa-fire"></i> <span>Dashboard</span></a></li>

        {{-- <li class="menu-header">PENYEDIAAN</li> --}}
        {{-- <li class="menu-header">RUANGAN</li> --}}
        <li class="{{ request()->is('room*') ? 'active' : '' }}">
          <a class="nav-link" href="{{ route('room-list.index') }}">
            <i class="fas fa-door-open"></i> <span>List Ruangan</span>
          </a>
        </li>

        {{-- <li class="menu-header">MOBIL</li> --}}
        <li class="{{ request()->is('cars*') ? 'active' : '' }}">
          <a class="nav-link" href="{{ route('cars-list.index') }}">
            <i class="fas fa-car"></i> <span>List Mobil</span>
          </a>
        </li>

        {{-- <li class="menu-header">TRANSAKSI</li> --}}
        <li class="{{ request()->is('my-booking-list*') ? 'active' : '' }}">
          <a class="nav-link" href="{{ route('my-booking-list.index') }}">
            <i class="fas fa-list"></i> <span>My Booking List</span>
          </a>
        </li>

        {{-- <li class="menu-header">SETTING</li> --}}
        <li class="{{ request()->is('change-pass*') ? 'active' : '' }}">
          <a class="nav-link" href="{{ route('user.change-pass.index') }}">
            <i class="fas fa-key"></i> <span>Ganti Password</span>
          </a>
        </li>

      @endif

      @if (in_array(Auth::user()->role, ['ADMIN', 'MANAGER']))

        <li class="menu-header">Dashboard @if (Auth::user()->role == 'MANAGER') Admin @endif</li>
        <li><a class="nav-link" href="{{ route('admin.dashboard') }}"><i class="fas fa-fire"></i> <span>Dashboard</span></a></li>

        {{-- <li class="menu-header">DATA MASTER</li> --}}
        <li class="{{ request()->is('admin/room*') ? 'active' : '' }}">
          <a class="nav-link" href="{{ route('room.index') }}">
            <i class="fas fa-door-open"></i> <span>Ruangan</span>
          </a>
        </li>
        <li class="{{ request()->is('admin/cars*') ? 'active' : '' }}">
          <a class="nav-link" href="{{ route('cars.index') }}">
            <i class="fas fa-car"></i> <span>Mobil</span>
          </a>
        </li>
        <li class="{{ request()->is('admin/user*') ? 'active' : '' }}">
          <a class="nav-link" href="{{ route('user.index') }}">
            <i class="fas fa-user"></i> <span>User</span>
          </a>
        </li>

        {{-- <li class="menu-header">TRANSAKSI</li> --}}
        <li class="{{ request()->is('admin/booking-list*') ? 'active' : '' }}">
          <a class="nav-link" href="{{ route('booking-list.index') }}">
            @inject('booking_list', 'App\Models\BookingList')
            <i class="fas fa-list"></i> <span>{{ $booking_list->where("status", "PENDING")->count() > 0 ? '('.$booking_list->where("status", "PENDING")->count().')' : '' }} Booking List</span>
          </a>
        </li>

        {{-- <li class="menu-header">SETTING</li> --}}
        <li class="{{ request()->is('admin/change-pass*') ? 'active' : '' }}">
          <a class="nav-link" href="{{ route('admin.change-pass.index') }}">
            <i class="fas fa-key"></i> <span>Ganti Password</span>
          </a>
        </li>

      @endif

      </ul>

  </aside>
</div>
