<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    use HasFactory;
    protected $table = 'image_sp';
    protected $primaryKey = 'id';
    protected $fillable = [
        'id_sp',
        'Images', // Add other fields that are mass assignable
    ];

    public $timestamps = false; // Disable timestamps


}
