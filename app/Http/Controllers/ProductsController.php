<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use App\Models\Product;
use App\Models\ProductImage;

class ProductsController extends Controller
{
    public function index(){
        // $products =  DB::table('ql_tt_sp')->where('ID_sp',7)->orWhere('Gia_sp','>'500)->select('ten_sp')->get();
        // $products =  DB::select("SELECT * FROM ql_tt_sp WHERE ID_sp = :id;", [
        //     'id' => 7,
        // ]);
        // $products =  DB::table('ql_tt_sp')->get();
        // $products = DB::table('ql_tt_sp')
        //                 ->where('ID_sp', '=',19)
        //                 ->update([
        //                     'ten_sp' => 'Sản phẩm mới',
        //                     'Gia_sp' => 444,
        //                     'ID_loai_sp' => 2,
        //                     'Nsx' => 2,
        //                 ]);
                        // ->insert([
                        //     'ten_sp' => 'Sản phẩm 1',
                        //     'Gia_sp' => 1000,
                        //     'ID_loai_sp' => 1,
                        //     'Nsx' => 1,
                        // ]);
        // $products = Product::all();
        // dd($products);
        return view('products.index');

    }
    // lấy tất sp
    public function getData()
    {
        // Lấy dữ liệu từ yêu cầu GET
        $products = Product::all();

        // Thực hiện xử lý dữ liệu hoặc trả về dữ liệu
        return response()->json(['message' => 'Data received', 'products' => $products]);
    }
    // lấy sp với id
    public function getData_id($id)
    {
        // Lấy dữ liệu từ yêu cầu GET
        $product = Product::with('allImage')->where('ID_sp', $id)->first();

        // Check if a record was found
        if ($product) {

            return response()->json(['message' => 'Data found', 'product' => $product]);
        } 
     
        else {
            return response()->json(['message' => 'Data not found'], 404);
        }
    }
    // thêm sản phẩm 
    public function store(Request $request)
    {
        // Validate inputs first
        $request->validate([
            'name' => 'required|string|max:255',
            'image1' => 'required|image|mimes:jpeg,png,jpg,gif,svg,webp|max:2048',
            'gia' => 'required|numeric',
            'loai' => 'required|integer',
            'nsx' => 'required|integer',
        ]);
    
        // Start the database transaction
        DB::beginTransaction();
    
        try {
            $uploadedFilePaths = [];
            $mainImagePath = null; // To store the path for the main image

            // Process main image
            if ($request->hasFile('image1')) {
                $mainImage = $request->file('image1');
                $mainImagePath = $mainImage->store('public/images');
                $mainImagePath = str_replace('public/', '', $mainImagePath); // Remove 'public/' from the path
                $uploadedFilePaths[] = $mainImagePath;
            }
    
            // Process additional images
            foreach ($request->allFiles() as $key => $image) {
                if (preg_match('/^image\d+$/', $key) && $key !== 'image1') {
                    $imagePath = $image->store('public/images');
                    $imagePath = str_replace('public/', '', $imagePath); // Remove 'public/' from the path
                    $uploadedFilePaths[] = $imagePath;
                }
            }
    
            // Create and save the product
            $product = Product::create([
                'ten_sp' => $request->input('name'),
                'Gia_sp' => $request->input('gia'),
                'ID_loai_sp' => $request->input('loai'),
                'Nsx' => $request->input('nsx'),
                'image' => $mainImagePath, // Save the main image path to the product's image column
            ]);
    
            // Save each additional product image
            foreach ($uploadedFilePaths as $imagePath) {
                if ($imagePath !== $mainImagePath) { // Only save additional images, not the main image again
                    ProductImage::create([
                        'id_sp' => $product->ID_sp,
                        'Images' => $imagePath,
                    ]);
                }
            }
    
            // Commit transaction
            DB::commit();
    
            return redirect('/products')->with('success', 'Product added successfully.');
    
        } 
        catch (\Exception $e) {
            // Rollback all database operations if an error occurs
            DB::rollback();
    
            // Delete uploaded files to clean up
            foreach ($uploadedFilePaths as $filePath) {
                Storage::delete('public/' . $filePath); // Ensure 'public/' is included for deletion
            }

            dd( $e->getMessage());
            //return redirect()->back()->withErrors(['error' => 'Failed to add product: ' . $e->getMessage()]);
        }
    }
    
    // sửa sản phẩm 
    public function update(Request $request,$id){

        // Validate inputs first
        $request->validate([
            'name' => 'required|string|max:255',
            'gia' => 'required|numeric',
            'loai' => 'required|integer',
            'nsx' => 'required|integer',
        ]);
    
        // Start the database transaction
        DB::beginTransaction();
    
        try {
            $uploadedFilePaths = [];
            $mainImagePath = null; // To store the path for the main image
            $validImageIds = []; // Array to store valid image IDs

            $product = Product::find($id);
    
            // Update other product fields first
            $product->update([
                'ten_sp' => $request->input('name'),
                'Gia_sp' => $request->input('gia'),
                'ID_loai_sp' => $request->input('loai'),
                'Nsx' => $request->input('nsx'),
            ]);

            // Update main image if it exists
            if ($request->hasFile('image1')) {
                $image1 = $request->file('image1');
                $imagePath1 = $image1->store('public/images');
                $imagePath1 = str_replace('public/', '', $imagePath1); // Remove 'public/' from the path
                $uploadedFilePaths[] = $imagePath1;

                // Delete the old image if it exists
                if ($product->image) {
                    Storage::delete($product->image); // Delete the old image
                }

                // Update the product's image path in the database with the new path
                $product->image = $imagePath1; 
                $product->save();
            }

            // Get all current image IDs from the form submission
            foreach ($request->all() as $key => $value) {
                if (preg_match('/^id_image(\d+)$/', $key, $matches)) {
                    $imageIndex = $matches[1]; // Extract the image number (e.g., '2' from 'id_image2')
                    $imageId = $value; // Get the ID from the form input

                    if ($imageId) {
                        $validImageIds[] = $imageId; // Add to valid IDs

                        // Check if the image has a file uploaded
                        if ($request->hasFile("image{$imageIndex}")) {
                            $image = $request->file("image{$imageIndex}");

                            if ($image) {
                                // Store the new image and update the path
                                $imagePath = $image->store('public/images');
                                $imagePath = str_replace('public/', '', $imagePath);
                                $uploadedFilePaths[] = $imagePath;

                                // Find the existing image record by ID
                                $productImage = ProductImage::find($imageId);
                                
                                if ($productImage) {
                                    // Delete the old image file if it exists
                                    Storage::delete('public/' . $productImage->Images);

                                    // Update the existing image record with the new path
                                    $productImage->update([
                                        'Images' => $imagePath,
                                    ]);
                                }
                            }
                        }
                    }
                }
                elseif (preg_match('/^image(\d+)$/', $key, $matches) && !$request->has("id_image{$matches[1]}")) {
                    $image = $request->file($key);
                    if ($image) {
                        $imagePath = $image->store('public/images');
                        $imagePath = str_replace('public/', '', $imagePath);
                        $uploadedFilePaths[] = $imagePath;
        
                        // Add new image record
                        $newProductImage = ProductImage::create([
                            'id_sp' => $product->ID_sp,
                            'Images' => $imagePath,
                        ]);
    
                        // Add newly created image ID to valid IDs to avoid deletion
                        $validImageIds[] = $newProductImage->id;
                    }
                }
            }

            // Fetch all existing images for this product
            $existingProductImages = ProductImage::where('ID_sp', $product->ID_sp)->get();

            // Loop through each existing image and delete if not in the valid list
            foreach ($existingProductImages as $productImage) {
                if (!in_array($productImage->id, $validImageIds)) {
                    // Delete the image file
                    Storage::delete('public/' . $productImage->Images);
                    // Delete the image record from the database
                    $productImage->delete();
                }
            }
    
            // // Commit transaction
            DB::commit();
    
            return redirect('/products')->with('success', 'Product added successfully.');
    
        } 
        catch (\Exception $e) {
            // Rollback all database operations if an error occurs
            DB::rollback();
    
            // Delete uploaded files to clean up
            foreach ($uploadedFilePaths as $filePath) {
                Storage::delete('public/' . $filePath); // Ensure 'public/' is included for deletion
            }
            dd( $e->getMessage());
            //return redirect()->back()->withErrors(['error' => 'Failed to add product: ' . $e->getMessage()]);
        }
        
    }
    //xóa sản phẩm
    public function destroy($id){
        // Retrieve the product by ID
        $product = Product::findOrFail($id);

        // Delete the main image of the product if it exists
        if ($product->image) {
            Storage::delete('public/' . $product->image); // Delete the product's main image
        }

        // Retrieve all related images from ProductImage model
        $productImages = ProductImage::where('id_sp', $id)->get();

        // Loop through each image and delete it from storage
        foreach ($productImages as $productImage) {
            if ($productImage->Images) {
                Storage::delete('public/' . $productImage->Images); // Delete the associated image file
            }
        }

        // Delete the related image records from the database
        ProductImage::where('id_sp', $id)->delete();

        // Delete the product record itself
        $product->delete();

        // Redirect or return a response
        return redirect('/products')->with('success', 'Product and all associated images have been deleted successfully.');
    }


    
    
}
