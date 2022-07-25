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
        $start = strtotime("10 april 2022");
        $end = strtotime("01 aug 2022");

        $ids = Employee::pluck("employee_id");

        foreach ($ids as $id) {
            $date_range = mt_rand($start, $end);
            $date = date("Y-m-d H:i:s", $date_range);

            $employee = AttendanceLog::create([
                "UserID" => $id,
                "DeviceID" => "OX-8862021010011",
                "LogTime" => $date,
                "company_id" => 1
            ]);
        }


        // $this->call([ MasterSeeder::class ]);
        // $this->call([ RoleSeeder::class ]);
        // $this->call([ PermissionSeeder::class ]);
        // $this->call([ DeviceStatusSeeder::class ]);
        // $this->call([ CompanySeeder::class ]);

        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
