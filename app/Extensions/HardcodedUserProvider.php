<?php

namespace App\Extensions;

use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Contracts\Auth\UserProvider;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\GenericUser;

class HardcodedUserProvider implements UserProvider
{
    // Data hardcode Anda
    protected $users = [
        ['id' => 1, 'email' => 'admin@example.com', 'password' => '$2y$10$kF4SRYn/KpDVWkAYUmkim.C3N4dAdWg.65h.eqlMxm66E47QG9NDG', 'remember_token' => null, 'is_admin' => true, 'name' => 'Admin'],
    ];

    public function retrieveById($identifier)
    {
        $user = collect($this->users)->firstWhere('id', $identifier);
        return $user ? new GenericUser($user) : null;
    }

    public function retrieveByCredentials(array $credentials)
    {
        $user = collect($this->users)->firstWhere('email', $credentials['email']);
        return $user ? new GenericUser($user) : null;
    }

    public function validateCredentials(Authenticatable $user, array $credentials)
    {
        return Hash::check($credentials['password'], $user->getAuthPassword());
    }

    // Implementasikan method kosong lainnya (retrieveByToken, updateRememberToken) jika tidak digunakan
    public function retrieveByToken($identifier, $token) {}
    public function updateRememberToken(Authenticatable $user, $token) {}
}
