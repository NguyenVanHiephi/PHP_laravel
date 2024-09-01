<?php

if (!function_exists('format_currency_vnd')) {
    function format_currency_vnd($number) {

        $number = preg_replace('/[^0-9.]/', '', $number);

        if (is_numeric($number)) {
            $number = (float) $number; // or (int) if you don't want decimals
        } else {
            return "Invalid input"; // Return an error message or handle as needed
        }
        
        return number_format($number, 0, ',', '.') . ' VND';
    }
}

?>