<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->where('is_master',1)->where('role_id',0)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }

        return response()->json([
            'token' => $user->createToken('myApp')->plainTextToken,
            'user' => $user,
        ], 200);
    }
    public function CompanyLogin(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::whereEmail($request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }

        return response()->json([
            'token' => $user->createToken('myApp')->plainTextToken,
            'user' => $user,
        ], 200);
    }
    public function me(Request $request)
    {

        $user = User::where('email', $request->user()->email)->first();

		if($user && $user->assigned_permissions){
			$user->permissions = $user->assigned_permissions->permissions_array;
		}
		else{
			$user->permissions = [];
		}
        $user->company = Company::whereUserId($user->id)->first() ?? null;

		return response()->json([ 'user' => $user ],200);


        $user = Auth::user();
        return response()->json([
            'user' => $user,
            'permissions' => []
        ], 200);
    }
}
