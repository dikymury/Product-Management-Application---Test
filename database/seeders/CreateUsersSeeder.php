<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CreateUsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert(
            [
                'id' => '183a1615-623f-443c-9cec-7870d061caca',
                'name' => 'admin',
                'email' => 'admin@example.com',
                'password' => bcrypt('admin123'),
                'is_admin' => 1,
            ],
            [
                'id' => '183a1615-623f-443c-9cec-7870d061cac2',
                'name' => 'user',
                'email' => 'user@mail.com',
                'password' => bcrypt('tes123'),
                'is_admin' => 0,
            ]
        );
    }
}
