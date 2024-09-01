<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ProductImage;

class Product extends Model
{
    use HasFactory;
    protected $table = 'ql_tt_sp';
    protected $primaryKey = 'ID_sp';
    // Allow mass assignment for these fields
    protected $fillable = [
        'ten_sp',
        'Gia_sp',
        'ID_loai_sp',
        'Nsx',
        'image', // Add other fields that are mass assignable
    ];

    public $timestamps = false; // Disable timestamps

    public function allImage()
    {
        return $this->hasMany(ProductImage::class, 'id_sp', 'ID_sp')->select('id', 'id_sp', 'Images');
    }
}
