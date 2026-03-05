@extends('layouts.admin')
@section('title')
    Products
@endsection
@push('style')
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/tables/datatable/datatables.min.css') }}">
    <style>
        select.form-control:not([multiple='multiple']) {
            background-position: calc(100% - 12px) 9px, calc(100% - 20px) 13px, 100% 0 !important;
        }

        .modal-content table {
            width: 100% !important;
        }

        .modal-content table td {
            border: none !important;
            padding: 0.5rem !important;
        }

        .title-prove {
            font-size: 15px;
            font-weight: 500;
            padding: 5px;
        }

        .image-prove {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #e7e7e7;
            padding: 10px;
            border-radius: 5px;
        }

        .image-prove img {
            max-width: 500px;
        }
    </style>
@endpush
@section('content')
    <h1>Products</h1>
    <p>
        Products Page is a section of the Product Management Application where businesses can manage their product listings
    </p>
    <div class="content-body">
        <section>
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 d-flex mb-1 justify-content-between" style="margin: 5px 0px">
                                        <div>
                                            <a href="{{ route('admin.dashboard.create') }}"
                                                class="btn btn-primary mr-1 waves-effect waves-light"><i
                                                    class="feather icon-plus"></i>&nbsp; Add</a>
                                        </div>
                                        <div id="DataTables_Table_0_filter" class="dataTables_filter">
                                            <label class="d-flex align-items-center">
                                                Search:&nbsp;
                                                <input id="search-input" value="{{ app('request')->input('search') }}"
                                                    type="search" class="form-control form-control" placeholder=""
                                                    aria-controls="DataTables_Table_0">
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>Color</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($data as $key => $item)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td>
                                                        {{ $item['name'] }}
                                                    </td>
                                                    <td>
                                                        @if (isset($item['data']['price']))
                                                            {{ Component::formatCurrency($item['data']['price']) }}
                                                        @else
                                                            -
                                                        @endif
                                                    </td>
                                                    <td>
                                                        {{ $item['data']['color'] ?? '-' }}
                                                    </td>
                                                    <td style="white-space: nowrap; width: 100px">
                                                        <a href="{{ route('admin.dashboard.edit', $item['id']) }}"
                                                            class="btn btn-icon text-white btn-primary waves-effect waves-light">
                                                            <i class="feather icon-edit"></i>
                                                        </a>
                                                        <button data-toggle="modal" data-target="#delete{{ $item['id'] }}"
                                                            class="btn btn-icon text-white btn-danger waves-effect waves-light">
                                                            <i class="feather icon-trash-2"></i>
                                                        </button>
                                                        <div class="modal-danger mr-1 mb-1 d-inline-block">
                                                            <!-- Modal -->
                                                            <div class="modal fade text-left" id="delete{{ $item['id'] }}"
                                                                tabindex="-1" role="dialog"
                                                                aria-labelledby="myModalLabel140" aria-hidden="true">
                                                                <div class="modal-dialog modal-xs modal-dialog-centered modal-dialog-scrollable"
                                                                    role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header white">
                                                                            <h5 class="modal-title" id="myModalLabel140">
                                                                                Confrimation</h5>
                                                                            <button type="button" class="close"
                                                                                data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Are you sure to delete this product?
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <form
                                                                                action="{{ route('admin.dashboard.destroy', $item['id']) }}"
                                                                                method="post">
                                                                                @csrf
                                                                                @method('delete')
                                                                                <button type="submit"
                                                                                    class="btn btn-danger">Delete</button>
                                                                                <button type="button"
                                                                                    class="btn btn-warning"
                                                                                    data-dismiss="modal">Cancel</button>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            @empty($data)
                                                <tr>
                                                    <td colspan="5" class="text-center">No data available</td>
                                                </tr>
                                            @endempty
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
@push('script')
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/datatables.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/datatables.buttons.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/buttons.print.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('app-assets/js/scripts/datatables/datatable.js') }}"></script>
    <script>
        $('#search-input').on('change', function(event) {
            let params = $(this).val();
            if (params) {
                window.location = "{{ route('admin.dashboard') }}" + "?search=" + params;
            } else {
                window.location = "{{ route('admin.dashboard') }}";
            }
        })
    </script>
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
