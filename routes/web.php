<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\SupplierController;
use App\Models\Product;

Route::resource('/products', ProductsController::class);

Route::get('/', function () {
    $products = Product::all();
    return view('index' , [
        'products' => $products,
    ]);
    // return env('MY_NAME');
});

Route::get('/get-data', [ProductsController::class, 'getData'])->name('products.getData');  
Route::get('/get-data_id/{id}', [ProductsController::class, 'getData_id'])->name('products.getData_id');
Route::get('/get_cate_id/{id}', [CategoriesController::class, 'get_cate_id'])->name('categories.get_cate_id');
Route::get('/get_cate', [CategoriesController::class, 'get_cate'])->name('categories.get_cate');
Route::get('/get_supplier', [SupplierController::class, 'get_ncc'])->name('supplier.get_ncc');
Route::get('/get_supplier_id/{id}', [SupplierController::class, 'get_ncc_id'])->name('supplier.get_ncc_id');
Route::post('/login',[])->name('login');