<?php

namespace App\Helpers;

use App\Models\Products;
use App\Models\RolesPermissions;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class Component
{

    public static function formatDateTime($datetime, $format = 'D/MM/YYYY HH:mm')
    {
        if (is_null($datetime)) {
            return '';
        }

        $carbon = $datetime instanceof Carbon ? $datetime : Carbon::parse($datetime);

        return $carbon->locale('id')->isoFormat($format);
    }

    public static function formatDate($date, $format = 'DD/MM/YYYY')
    {
        if (is_null($date)) {
            return '';
        }

        $carbon = $date instanceof Carbon ? $date : Carbon::parse($date);

        return $carbon->locale('id')->isoFormat($format);
    }

    public static function formatNumber($number, $decimals = 0)
    {
        return number_format($number, $decimals, ',', '.');
    }

    public static function formatCurrency($number)
    {
        return '$ ' . self::formatNumber($number);
    }
}
