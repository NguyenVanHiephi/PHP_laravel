<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Supplier;

class SupplierController extends Controller
{
    public function index(){
        return view('supplier.index');
    }

    public function get_ncc(){
        $ncc = Supplier::all();
        return response()->json($ncc);
    }

    public function get_ncc_id($id){
        $ncc = Supplier::find($id);
        if($ncc){
            return response()->json(['status' => 200, 'data' => $ncc]);
        }
        else{
            return response()->json(['status' => 404, 'message' => 'Not found']);
        }
    }
}
