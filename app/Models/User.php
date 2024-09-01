<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

// class User extends Authenticatable
// {
//     use HasFactory, Notifiable;
//     protected $table = 'user';

//     /**
//      * The attributes that are mass assignable.
//      *
//      * @var array<int, string>
//      */
//     protected $fillable = [
//         'Names',
//         'Email',
//         'Pass',
//     ];

//     /**
//      * The attributes that should be hidden for serialization.
//      *
//      * @var array<int, string>
//      */
//     protected $hidden = [
//         'Pass',
//         'remember_token',
//     ];

//     /**
//      * Get the attributes that should be cast.
//      *
//      * @return array<string, string>
//      */
//     // protected function casts(): array
//     // {
//     //     return [
//     //         'password' => 'hashed',
//     //     ];
//     // }
//     // Automatically hash password using custom hash function
//     public function setPasswordAttribute($value)
//     {
//         $this->Pass = self::hashpass($value);
//     }

//     // Custom hash function
//     private static function hashpass($pass)
//     {
//         if (!defined('SALT')) {
//             define('SALT', 'hihiepr93fut4hhb8hfr7t487hfe4');
//         }
//         return password_hash($pass . SALT, PASSWORD_BCRYPT);
//     }
// }
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'user';
    protected $fillable = ['Names', 'Email', 'Pass'];
    protected $hidden = ['Pass', 'remember_token','roles'];

     // Băm mật khẩu trước khi lưu vào cơ sở dữ liệu
     public function setPasswordAttribute($value)
     {
         $this->attributes['Pass'] = self::hashpass($value);
     }
 
     private static function hashpass($pass)
     {
         return password_hash($pass . env('SALT'), PASSWORD_BCRYPT);
     }
 
     // Xác thực mật khẩu với SALT
     public function verifyPassword($password)
     {
         return password_verify($password . env('SALT'), $this->Pass);
     }
}
