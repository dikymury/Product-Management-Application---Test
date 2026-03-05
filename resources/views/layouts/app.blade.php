<!DOCTYPE html>
<html lang="en">

<head>
    @if (trim($__env->yieldContent('title')))
        <title>@yield('title')</title>
    @else
        <title>{{ env('APP_NAME', 'Spectrum') }}</title>
    @endif
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="ie=edge" http-equiv="x-ua-compatible">
    <meta content="spectrum china" name="author">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#01528D">
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
    <meta name="description" content="@yield('desc')">
    {{-- titter share --}}
    <meta name="twitter:title" content="@yield('title')">
    <meta name="twitter:description" content="@yield('desc')">
    {{-- end titter share --}}
    {{-- Google+ / Schema.org --}}
    <meta itemprop="name" content="@yield('title')">
    <meta itemprop="description" content="@yield('desc')">
    {{-- end Google+ / Schema.org --}}
    {{-- fb --}}
    <meta property="fb:app_id" content="{{env("FB_ID")}}" >
    <meta property="og:title" content="@yield('title')">
    <meta property="og:description" content="@yield('desc')">

    <meta property="og:url" content="{{ url()->current() }}">
    <meta property="og:type" content="website">
    <meta property="og:image" content="@yield('image')">
    <meta property="og:locale" content="id_ID">

    <meta property="keywords" content="spectrum china, spectrum LED, spectrum LCD">
    <meta property="og:site_name" content="{{ url('') }}">
    {{-- end fb --}}

    <meta name="msapplication-TileColor" content="#01528D">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link rel="canonical" href="{{ url()->current() }}">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600;700;800&display=swap"
        rel="stylesheet">
    <link href="{{ asset('assets/css/icon.min.css') }}?id=3" rel="stylesheet">
    <link href="{{ asset('assets/css/main.min.css') }}?id=3" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('assets/js/aos/aos.css') }}" />
    <link href="{{ asset('assets/css/app.min.css') }}?id=3" rel="stylesheet">
    @stack('style')
    <script  type="application/ld+json">
        {
            "@context":"http://schema.org",
            "@type":"WebSite",
            "name":"@yield('title')",
            "alternateName":"Spectrum",
            "url":"{{url()->current()}}"
        }
    </script>
</head>

<body>
    @include('frontend.components.header')
    <div class="mx-auto relative w-full bg-gray-1">
        <div class="w-full h-full bg-white">
            @yield('content')
        </div>
    </div>
    </div>
    @include('frontend.components.footer')
    <div id="onview" class="hidden">
        <div class="onview-c">
            View
        </div>
    </div>
    <script src="{{ asset('assets/js/jquery-3.1.1.min.js') }}"></script>
    <script src="{{ asset('assets/js/aos/aos.js') }}"></script>
    <script>
        AOS.init({
            duration: 1000,
            once: false,
            offset: 150,
        });
        window.onscroll = function() {
            scrollFunction()
        };
        header = document.getElementById("headers");
        headerMobile = document.getElementById("headers-mobile");

        const counters = document.querySelectorAll('.value');
        const speed = 500;
        let formatter = new Intl.NumberFormat({
            minimumFractionDigits: 0
        })

        function parseLocaleNumber(stringNumber, locale) {
            var thousandSeparator = Intl.NumberFormat(locale).format(11111).replace(/\p{Number}/gu, '');
            var decimalSeparator = Intl.NumberFormat(locale).format(1.1).replace(/\p{Number}/gu, '');

            return parseFloat(stringNumber
                .replace(new RegExp('\\' + thousandSeparator, 'g'), '')
                .replace(new RegExp('\\' + decimalSeparator), '.')
            );
        }


        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                header.style["background-color"] = "rgb(255 255 255)";
                headerMobile.style["background-color"] = "rgb(255 255 255)";
            } else {
                header.style["background-color"] = "rgb(255 255 255 / 0.7)";
                headerMobile.style["background-color"] = "rgb(255 255 255 / 0.7)";
            }

            if (document.body.scrollTop > 150 || document.documentElement.scrollTop > 150) {
                counters.forEach(counter => {
                    const animate = () => {
                        const value = +counter.getAttribute('akhi');
                        const data = +parseLocaleNumber(counter.innerText);

                        const time = value / speed;
                        if (data < value) {
                            counter.innerText = formatter.format(Math.ceil(data + time));
                            setTimeout(animate, 1);
                        } else {
                            counter.innerText = formatter.format(value);
                        }

                    }

                    animate();
                });
            }
        }
        $(document).on('click', '.toggle-menu', function() {
            var x = document.querySelector("#sidemenu-mobile");
            if (x.className.includes('show-sidemenu')) {
                x.classList.remove('show-sidemenu');
            } else {
                x.classList.add('show-sidemenu');
            }

        });
    </script>
    <script>
        $(document).ready(function() {
            let url = window.location.href;
            if (url == "{{ route('showcase') }}") {
                $('#mmshowcase').addClass("mobile-menu-active");
                $('#mshowcase').addClass("mobile-menu-active");
            } else if (url == "{{ route('products') }}") {
                $('#mmproducts').addClass("mobile-menu-active");
                $('#mproducts').addClass("mobile-menu-active");
            } else if (url == "{{ route('support') }}") {
                $('#mmsupport').addClass("mobile-menu-active");
                $('#msupport').addClass("mobile-menu-active");
            } else if (url == "{{ route('about-us') }}") {
                $('#mmaboutus').addClass("mobile-menu-active");
                $('#maboutus').addClass("mobile-menu-active");
            } else if (url == "{{ route('news') }}") {
                $('#mmnews').addClass("mobile-menu-active");
                $('#mnews').addClass("mobile-menu-active");
            }

            // header
            $("#mproducts").click(function() {
                if ($("#mproducts-content").hasClass("products-show")) {
                    $("#mproducts-content").removeClass('products-show');
                } else {
                    $("#mproducts-content").addClass('products-show');
                }
            });
            $("#mproducts-overlay").click(function() {
                $("#mproducts-content").removeClass('products-show');

            });
            var menus_products = {!! json_encode(Component::categories()) !!}
            $(".mproducts-category li a").hover(function() {
                let dataId = $(this).attr("data-id");
                for (let idx = 0; idx < menus_products.length; idx++) {
                    const element = menus_products[idx];
                    if (element.id == dataId) {
                        console.log(element);
                        let newUl = "";
                        for (let idxx = 0; idxx < element.sub_products.length; idxx++) {
                            const el = element.sub_products[idxx];
                            newUl += "<li class='text-xs text-gray-1'>" +
                                "<a href='/products/" + element.slug + "/" + el.slug +
                                "' class='hover:text-black-dark hover:underline'> " + el.title + "</a>" +
                                "</li>";
                        }
                        $(".mproducts-subproducts").html(newUl);
                    }
                }
                $(".mproducts-category").each(function(k, v) {
                    $(this).each(function(k, v) {
                        $(this).children('li').children('a').children('.pm-category-icon')
                            .addClass('hidden');
                    })
                })
                $(this).children('.pm-category-icon').removeClass('hidden');
                $(this).children('.pm-category-icon').addClass('block');
            });
            $(".mproducts-category li a").hover(function() {
                let dataId = $(this).attr("data-id");
                for (let idx = 0; idx < menus_products.length; idx++) {
                    const element = menus_products[idx];
                    if (element.id == dataId) {
                        console.log(element);
                        let newUl = "";
                        for (let idxx = 0; idxx < element.sub_products.length; idxx++) {
                            const el = element.sub_products[idxx];
                            newUl += "<li class='text-xs text-gray-1'>" +
                                "<a href='/products/" + element.slug + "/" + el.slug +
                                "' class='hover:text-black-dark hover:underline'> " + el.title + "</a>" +
                                "</li>";
                        }
                        $(".mproducts-subproducts").html(newUl);
                    }
                }
                $(".mproducts-category").each(function(k, v) {
                    $(this).each(function(k, v) {
                        $(this).children('li').children('a').children('.pm-category-icon')
                            .addClass('hidden');
                    })
                })
                $(this).children('.pm-category-icon').removeClass('hidden');
                $(this).children('.pm-category-icon').addClass('block');
            });
            $(".mmproducts-menu li .mmproducts-menu-1").click(function() {
                if ($(this).parent().parent().children('.mmproducts-products').hasClass('hidden')) {
                    $(".mmproducts-menu").each(function(k, v) {
                        $(this).each(function(k, v) {
                            $(this).children('li').children('.mmproducts-products')
                                .addClass('hidden');
                        })
                    })
                    $(this).parent().parent().children('.mmproducts-products').removeClass('hidden');
                    $(this).parent().parent().children('.mmproducts-products').addClass('block');
                    $(this).addClass('rotate90');
                } else {
                    $(this).parent().parent().children('.mmproducts-products').removeClass('block');
                    $(this).parent().parent().children('.mmproducts-products').addClass('hidden');
                    $(this).removeClass('rotate90');
                }
            });
            $(".mmproducts-products li .mmproducts-menu-2").click(function() {
                if ($(this).parent().parent().children('.mmproducts-subproducts').hasClass('hidden')) {
                    $(".mmproducts-products").each(function(k, v) {
                        $(this).each(function(k, v) {
                            $(this).children('li').children('.mmproducts-subproducts')
                                .addClass(
                                    'hidden');
                            $(this).children('li').children('.pdx').children('.mmproducts-menu-2')
                                .removeClass('rotate90');

                        })
                    })
                    $(this).parent().parent().children('.mmproducts-subproducts').removeClass('hidden');
                    $(this).parent().parent().children('.mmproducts-subproducts').addClass('block');
                    $(this).addClass('rotate90');
                } else {
                    $(this).parent().parent().children('.mmproducts-subproducts').removeClass('block');
                    $(this).parent().parent().children('.mmproducts-subproducts').addClass('hidden');
                    $(this).removeClass('rotate90');
                }
            });
        });
    </script>
    @stack('script')
</body>

</html>
