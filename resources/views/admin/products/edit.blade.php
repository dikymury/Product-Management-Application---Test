@extends('layouts.admin')
@section('title')
    Edit Product
@endsection
@push('style')
@endpush
@section('content')
    <h1 class="mb-1">Edit Product</h1>
    <div class="content-body">
        <section>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body card-dashboard">
                                <form action="{{ route('admin.dashboard.update', $data['id']) }}" method="POST">
                                    @method('put')
                                    @csrf
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12 col-12">
                                            <div class="form-group @error('name') issue @enderror">
                                                <div class="controls">
                                                    <label for="name">Nama</label>
                                                    <input type="text" class="form-control" name="name"
                                                        value="{{ old('name') ?? $data['name'] }}"
                                                        @error('name') aria-invalid="true" @enderror
                                                        placeholder="Masukkan nama">
                                                    <div class="help-block">
                                                        @error('name')
                                                            <ul role="alert">
                                                                <li>
                                                                    {{ $message }}
                                                                </li>
                                                            </ul>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 col-12">
                                            <div class="form-group @error('year') issue @enderror">
                                                <div class="controls">
                                                    <label for="year">Year</label>
                                                    <select name="year" id="year" class="form-control">
                                                        @foreach ($years as $year)
                                                            <option value="{{ $year }}"
                                                                {{ old('year') == $year || (isset($data['data']['year']) && $data['data']['year'] == $year) ? 'selected' : '' }}>
                                                                {{ $year }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                    <div class="help-block">
                                                        @error('year')
                                                            <ul role="alert">
                                                                <li>
                                                                    {{ $message }}
                                                                </li>
                                                            </ul>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 col-12">
                                            <div class="form-group @error('price') issue @enderror">
                                                <div class="controls">
                                                    <label for="price">Price</label>
                                                    <fieldset class="form-group position-relative has-icon-left mb-0">
                                                        <input type="number" class="form-control" name="price"
                                                            @error('price') aria-invalid="true" @enderror
                                                            value="{{ old('price') ?? $data['data']['price'] }}"
                                                            placeholder="Enter price">
                                                        <div class="form-control-position">
                                                            $
                                                        </div>
                                                    </fieldset>
                                                    <div class="help-block">
                                                        @error('price')
                                                            <ul role="alert">
                                                                <li>
                                                                    {{ $message }}
                                                                </li>
                                                            </ul>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 col-12">
                                            <div class="form-group @error('cpu_model') issue @enderror">
                                                <div class="controls">
                                                    <label for="cpu_model">CPU Model</label>
                                                    <input type="text" class="form-control" name="cpu_model"
                                                        @error('cpu_model') aria-invalid="true" @enderror
                                                        value="{{ old('cpu_model') ?? $data['data']['CPU model'] }}"
                                                        placeholder="Enter CPU model">
                                                    <div class="help-block">
                                                        @error('cpu_model')
                                                            <ul role="alert">
                                                                <li>
                                                                    {{ $message }}
                                                                </li>
                                                            </ul>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 col-12">
                                            <div class="form-group @error('hardisk_size') issue @enderror">
                                                <div class="controls">
                                                    <label for="hardisk_size">Hardisk Size</label>

                                                    <fieldset class="form-group position-relative has-icon-right mb-0">
                                                        <input type="number" class="form-control" name="hardisk_size"
                                                            @error('hardisk_size') aria-invalid="true" @enderror
                                                            value="{{ old('hardisk_size') ?? $data['data']['Hard disk size'] }}"
                                                            placeholder="Enter hardisk size">
                                                        <div class="form-control-position">
                                                            TB
                                                        </div>
                                                    </fieldset>

                                                    <div class="help-block">
                                                        @error('hardisk_size')
                                                            <ul role="alert">
                                                                <li>
                                                                    {{ $message }}
                                                                </li>
                                                            </ul>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="w-full d-flex justify-content-start">
                                        <button type="submit"
                                            class="btn btn-primary mr-1 mb-1 waves-effect waves-light">Simpan</button>
                                        <a href="{{ route('admin.dashboard') }}"
                                            class="btn btn-outline-warning mr-1 mb-1 waves-effect waves-light">Batal</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
@push('script')
    <script>
        $(document).ready(function() {
            $("form").submit(function(e) {
                e.preventDefault();
                this.submit();
                showLoading();
            });
        });
    </script>
@endpush
