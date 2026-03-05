<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function index()
    {
        if (Auth::guard('web')->check()) {
            return redirect()->route('admin.dashboard');
        }
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $customMessages = [
            'email.required' => 'Kolom email belum diisi.',
            'password.required' => 'Kolom kata sandi belum diisi.',
            'password.min' => 'Kata sandi minimal 6 karakter.',
        ];

        Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required|min:6',
        ], [], $customMessages)->validate();

        // Proses login
        if (Auth::guard('web')->attempt(['email' => $request->email, 'password' => $request->password])) {
            return redirect()->route('admin.dashboard');
        } else {
            return redirect()->back()->with(['error' => 'Email or password is incorrect']);
        }
    }

    public function logout()
    {
        Auth::guard('web')->logout();

        session()->flush();

        return redirect()->route('admin.login');
    }
}
