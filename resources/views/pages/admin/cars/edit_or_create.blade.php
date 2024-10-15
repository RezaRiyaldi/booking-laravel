@extends('layouts.main')

@section('title')
  @if(isset($item))
    Edit Data Mobil - ROOMING
  @else
    Tambah Data Mobil - ROOMING
  @endif
@endsection

@section('header-title')
  @if(isset($item))
    Edit Data Mobil
  @else
    Tambah Data Mobil
  @endif
@endsection

@section('breadcrumbs')
  <div class="breadcrumb-item"><a href="#">Mobil</a></div>
  <div class="breadcrumb-item"><a href="{{ route('cars.index') }}">Data Mobil</a></div>
  <div class="breadcrumb-item @if(isset($item)) '' @else 'active' @endif">
    @if(isset($item))
      <a href="#">Edit Data Mobil</a>
    @else
      Tambah Data Mobil
    @endif
  </div>
  @isset($item)
    <div class="breadcrumb-item active">{{ $item->name }}</div>
  @endisset
@endsection

@section('section-title')
  @if(isset($item))
    Edit Data Mobil
  @else
    Tambah Data Mobil
  @endif
@endsection

@section('section-lead')
  Silakan isi form di bawah ini untuk @if(isset($item)) mengedit data {{ $item->name }} @else menambah data Mobil. @endif
@endsection

@section('content')

  @component('components.form')

    @slot('row_class', 'justify-content-center')
    @slot('col_class', 'col-12 col-md-6')

    @if(isset($item))
      @slot('form_method', 'POST')
      @slot('method', 'PUT')
      @slot('form_action', 'cars.update')
      @slot('update_id', $item->id)
    @else
      @slot('form_method', 'POST')
      @slot('form_action', 'cars.store')
    @endif

    @slot('is_form_with_file', 'true')

    @slot('input_form')

      @component('components.input-field')
          @slot('input_label', 'Nama')
          @slot('input_type', 'text')
          @slot('input_name', 'name')
          @isset($item->name)
            @slot('input_value')
              {{ $item->name }}
            @endslot
          @endisset
          @empty($item)
            @slot('form_group_class', 'required')
            @slot('other_attributes', 'required autofocus')
          @endempty
      @endcomponent

      @component('components.input-field')
          @slot('input_label', 'Deskripsi')
          @slot('input_type', 'text')
          @slot('input_name', 'description')
          @isset($item->description)
            @slot('input_value')
              {{ $item->description }}
            @endslot
          @endisset
          @isset($item)
            @slot('other_attributes', 'autofocus')
          @endisset
      @endcomponent

      @component('components.input-field')
          @slot('input_label', 'Plat Nomor')
          @slot('input_type', 'text')
          @slot('input_name', 'license_plate')
          @isset($item->license_plate)
            @slot('input_value')
              {{ $item->license_plate }}
            @endslot
          @endisset
      @endcomponent

      @component('components.input-field')
          @slot('input_label', 'Foto')
          @slot('input_type', 'file')
          @slot('input_name', 'photo')
          @isset($item)
            @slot('help_text', 'Tidak perlu input foto jika tidak ingin mengeditnya')
          @endisset
      @endcomponent

    @endslot

    @slot('card_footer', 'true')
    @slot('card_footer_class', 'text-right')
    @slot('card_footer_content')
      @include('includes.save-cancel-btn')
    @endslot

  @endcomponent

@endsection
