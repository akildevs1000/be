<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\DeviceStatus;

class DeviceStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DeviceStatus::create(['name'=>'active']);
        DeviceStatus::create(['name'=>'inactive']);
    }
}
