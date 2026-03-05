@extends('layouts.auth')
@section('title')
    Login
@endsection
@push('style')
@endpush
@section('content')
    <section class="row flexbox-container">
        <div class="col-xl-8 col-11 d-flex justify-content-center">
            <div class="card bg-authentication rounded-0 mb-0">
                <div class="row m-0">
                    <div class="col-lg-6 d-lg-block d-none text-center align-self-center px-1 py-0">
                        <img src="{{ asset('app-assets/images/pages/login.png') }}" alt="branding logo">
                    </div>
                    <div class="col-lg-6 col-12 p-0">
                        <div class="card pb-2 rounded-0 mb-0 px-2">
                            <div class="card-header pb-1">
                                <div class="card-title">
                                    <h4 class="mb-0">Login</h4>
                                </div>
                            </div>
                            <p class="px-2">Selamat datang, silakan login ke akun anda
                            <div class="card-content">
                                <div class="card-body pt-1">
                                    <form id="formlogin" action="{{ route('admin.login.process') }}" method="post">
                                        @csrf
                                        <fieldset
                                            class="form-label-group form-group position-relative has-icon-left @error('email') issue @enderror">
                                            <input required type="text" class="form-control" name="email"
                                                placeholder="E-mail/Nama Pengguna"
                                                @error('email') aria-invalid="true" @enderror>
                                            @error('email')
                                                <div class="help-block">
                                                    <ul role="alert">
                                                        <li>{{ $message }}</li>
                                                    </ul>
                                                </div>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                            <label for="user-name">E-mail</label>
                                        </fieldset>
                                        <fieldset
                                            class="form-label-group form-group position-relative has-icon-left @error('password') issue @enderror">
                                            <input required type="password" class="form-control" name="password"
                                                placeholder="Kata Sandi" @error('password') aria-invalid="false" @enderror>
                                            @error('password')
                                                <div class="help-block">
                                                    <ul role="alert">
                                                        <li>{{ $message }}</li>
                                                    </ul>
                                                </div>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-lock"></i>
                                            </div>
                                            <label for="user-password">Kata Sandi</label>
                                        </fieldset>
                                        <div class="form-group d-flex justify-content-between align-items-center">
                                            <div class="text-left">
                                                <fieldset class="checkbox">
                                                    <div class="vs-checkbox-con vs-checkbox-primary">
                                                        <input type="checkbox">
                                                        <span class="vs-checkbox">
                                                            <span class="vs-checkbox--check">
                                                                <i class="vs-icon feather icon-check"></i>
                                                            </span>
                                                        </span>
                                                        <span class="">Ingat Saya</span>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary float-right btn-inline">Masuk</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('script')
    <script>
        $(document).ready(function() {
            $("#formlogin").submit(function(e) {
                e.preventDefault();
                this.submit();
                showLoading();
            });
        });
    </script>
@endpush
