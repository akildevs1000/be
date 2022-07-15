<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([ MasterSeeder::class ]);
        $this->call([ RoleSeeder::class ]);
        $this->call([ PermissionSeeder::class ]);
        $this->call([ DeviceStatusSeeder::class ]);
        $this->call([ CompanySeeder::class ]);

        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
