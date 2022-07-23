<?php

namespace Database\Seeders;

use App\Models\AttendanceLog;
use App\Models\Employee;
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
        // for ($i=1; $i <= 10; $i++) {
        //     AttendanceLog::factory(1)->create(["UserId" => $i]);
        // }

        // Employee::factory(2)->create();

        // return;

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
