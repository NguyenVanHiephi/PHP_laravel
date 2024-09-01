<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoriesController extends Controller
{
    public function index(){
        return view('categories.index');
    }

    public function get_cate(){
        $categories = Category::all();
        return response()->json($categories);
    }

    public function get_cate_id($id){
        $category = Category::find($id);
        if($category){
            return response()->json(['message' => 'Data found', 'category' => $category]);
        }
        else{
            return response()->json(['message' => 'Category not found'], 404);
        }
    }
    
}
