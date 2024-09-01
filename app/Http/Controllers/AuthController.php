<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use ILluminate\Support\Facades\Auth;


class AuthController extends Controller
{


    public function login(Request $request){

        $name = $request->input('name');
        $password = $request->input('password');

        if(!$name || !$password){
            return response()->json(['success'=> false,'message' => 'Vui lòng nhập đủ email và mật khẩu.'], 400);
        }
    
        $user = User::where('Names', $name)->first();
    
        if ($user && $user->verifyPassword($password)) {
            // Auth::login($user);
            $token = $user->createToken('auth_token');
            return response()->json(['success'=> true,'token' => $token->plainTextToken, 'message' => 'Đăng nhập thành công']);
        } else {
                
                return response()->json(['success'=> false, 'message' => 'Thông tin đăng nhập sai'],401);
            }
    }
    
    public function profile(Request $request){

        return response()->json([
            'success'=> true,
            'user' => $request->user()
        ]);

    }

}
