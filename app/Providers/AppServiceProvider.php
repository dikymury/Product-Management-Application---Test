<?php

namespace App\Providers;

use App\Extensions\HardcodedUserProvider;
use App\Models\RolesPermissions;
use App\View\Components\MenuAdmin;
use Illuminate\Support\Facades\Auth;
// use Carbon;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Auth::provider('hardcode', function ($app, array $config) {
            return new HardcodedUserProvider();
        });

        Blade::component('menu-admin', MenuAdmin::class);
        Schema::defaultStringLength(191);
    }
}
