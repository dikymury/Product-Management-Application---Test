<?php

use Illuminate\Support\Facades\Route;

Route::get('login', 'Auth\AuthController@index')->name('admin.login');
Route::post('login', 'Auth\AuthController@login')->name(
    'admin.login.process'
);

Route::middleware('is_admin')
    ->group(function () {
        Route::get('', 'Admin\DashboardController@index')->name(
            'admin.dashboard'
        );
        Route::get('create', 'Admin\DashboardController@create')->name(
            'admin.dashboard.create'
        );
        Route::post('store', 'Admin\DashboardController@store')->name(
            'admin.dashboard.store'
        );
        Route::get('edit/{id}', 'Admin\DashboardController@edit')->name(
            'admin.dashboard.edit'
        );
        Route::put('update/{id}', 'Admin\DashboardController@update')->name(
            'admin.dashboard.update'
        );
        Route::delete('destroy/{id}', 'Admin\DashboardController@destroy')->name(
            'admin.dashboard.destroy'
        );

        Route::get('logout', 'Auth\AuthController@logout')->name(
            'admin.logout'
        );
    });
