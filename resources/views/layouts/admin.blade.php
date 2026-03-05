<!DOCTYPE html>
<html lang="en">

<head>
    <title>@yield('title') | {{ env('APP_NAME', 'App') }}</title>
    <meta charset="utf-8">
    <meta content="ie=edge" http-equiv="x-ua-compatible">
    <meta content="template language" name="keywords">
    <meta content="Tamerlan Soziev" name="author">
    <meta content="@yield('title') | {{ env('APP_NAME', 'App') }}" name="description">
    <meta content="width=device-width, initial-scale=1" name="viewport">

    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">

    <link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/vendors.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/charts/apexcharts.css') }}">
    <link rel="stylesheet" type="text/css"
        href="{{ asset('app-assets/vendors/css/extensions/tether-theme-arrows.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/extensions/tether.min.css') }}">
    <link rel="stylesheet" type="text/css"
        href="{{ asset('app-assets/vendors/css/extensions/shepherd-theme-default.css') }}">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/bootstrap.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/bootstrap-extended.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/colors.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/components.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/themes/dark-layout.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/themes/semi-dark-layout.css') }}">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css"
        href="{{ asset('app-assets/css/core/menu/menu-types/vertical-menu.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/core/colors/palette-gradient.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/pages/dashboard-analytics.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/pages/card-analytics.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/plugins/tour/tour.css') }}">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/style.css') }}">
    <link href="{{ asset('vendor/toastr/toastr.min.css') }}" rel="stylesheet">
    <!-- END: Custom CSS-->
    <style>
        body.vertical-layout.vertical-menu-modern.menu-collapsed .main-menu:not(.expanded) .branch-school {
            display: none !important;
        }

        .loading {
            z-index: 999999;
            position: fixed;
            top: 0;
            left: -5px;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.398);
        }

        @keyframes slide {
            0% {
                transform: scale(1);
            }

            50% {
                opacity: 0.3;
                transform: scale(2);
            }

            100% {
                transform: scale(1);
            }
        }

        .loading-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate3d(-50%, -50%, 0);
        }

        .loading-content .dot {
            display: inline-block !important;
        }

        .dot {
            width: 35px;
            height: 35px;
            background: #3ac;
            border-radius: 100%;
            display: none;
            animation: slide 1s infinite;
        }

        .dot:nth-child(1) {
            animation-delay: 0.1s;
            background: #32aacc;
        }

        .dot:nth-child(2) {
            animation-delay: 0.2s;
            background: #64aacc;
        }

        .dot:nth-child(3) {
            animation-delay: 0.3s;
            background: #96aacc;
        }

        .dot:nth-child(4) {
            animation-delay: 0.4s;
            background: #ccaaaa;
        }

        .dot:nth-child(5) {
            animation-delay: 0.5s;
            background: #faaaaa;
        }
    </style>
    @stack('style')
</head>

<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click"
    data-menu="vertical-menu-modern" data-col="2-columns">
    {{-- loading --}}
    <section id="loading">
        <div id="loading-content">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
    </section>
    <!--------------------
    START - Navbar
    -------------------->
    @include('components.admin.nav')
    <!--------------------
    END - Navbar
    --------------------><!--------------------
    START - Main Menu
    -------------------->
    <x-menu-admin />
    <!--------------------
    END - Main Menu
    -------------------->
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            @yield('content')
        </div>
    </div>

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    @include('components.general.footer')

    <!-- BEGIN: Vendor JS-->
    <script src="{{ asset('app-assets/vendors/js/vendors.min.js') }}"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="{{ asset('app-assets/vendors/js/charts/apexcharts.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/extensions/tether.min.js') }}"></script>
    <script src="{{ asset('app-assets/vendors/js/extensions/shepherd.min.js') }}"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="{{ asset('app-assets/js/core/app-menu.js') }}"></script>
    <script src="{{ asset('app-assets/js/core/app.js') }}"></script>
    <script src="{{ asset('app-assets/js/scripts/components.js') }}"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <link rel="stylesheet" type="text/css"
        href="{{ asset('app-assets/css/plugins/forms/validation/form-validation.css') }}">
    <!-- END: Page JS-->
    <script>
        jQuery(document).ready(function() {
            $('form input').focus(function() {
                $(this).siblings(".help-block").hide();
                $(this).attr('aria-invalid', 'false');
            });
        });
    </script>
    <script src="{{ asset('vendor/toastr/toastr.min.js') }}"></script>
    @if (session()->has('success'))
        <script>
            toastr.success("{{ session('success') }}", 'Success');
        </script>
    @endif

    @if (session()->has('warning'))
        <script>
            toastr.warning("{{ session('warning') }}", 'Warning');
        </script>
    @endif

    @if (session()->has('info'))
        <script>
            toastr.info("{{ session('info') }}", 'Imformation');
        </script>
    @endif

    @if (session()->has('error'))
        <script>
            toastr.error("{{ session('error') }}", 'Error');
        </script>
    @endif
    <script>
        function showLoading() {
            document.querySelector('#loading').classList.add('loading');
            document.querySelector('#loading-content').classList.add('loading-content');
        }

        function hideLoading() {
            document.querySelector('#loading').classList.remove('loading');
            document.querySelector('#loading-content').classList.remove('loading-content');
        }
    </script>
    <script>
        $(document).ready(function() {
            let pathname = window.location.pathname == "/" ? "" : window.location.pathname;
            let url = window.location.protocol + "//" + window.location.host + pathname;
            console.log(url);
            console.log("{{ route('admin.dashboard') }}")

            if (url == "{{ route('admin.dashboard') }}") {
                $('#mdashboard').addClass("active");
            }
        });
    </script>
    @stack('script')
</body>

</html>
