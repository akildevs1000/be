<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Permission;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Permission::create(['name'=>'company_create']);
        Permission::create(['name'=>'company_edit']);
        Permission::create(['name'=>'company_delete']);
        Permission::create(['name'=>'company_view']);
        Permission::create(['name'=>'company_access']);

        Permission::create(['name'=>'branch_create']);
        Permission::create(['name'=>'branch_edit']);
        Permission::create(['name'=>'branch_delete']);
        Permission::create(['name'=>'branch_view']);
        Permission::create(['name'=>'branch_access']);

        Permission::create(['name'=>'device_create']);
        Permission::create(['name'=>'device_edit']);
        Permission::create(['name'=>'device_delete']);
        Permission::create(['name'=>'device_view']);
        Permission::create(['name'=>'device_access']);

        Permission::create(['name'=>'module_create']);
        Permission::create(['name'=>'module_edit']);
        Permission::create(['name'=>'module_delete']);
        Permission::create(['name'=>'module_view']);
        Permission::create(['name'=>'module_access']);

        Permission::create(['name'=>'assign_module_create']);
        Permission::create(['name'=>'assign_module_edit']);
        Permission::create(['name'=>'assign_module_delete']);
        Permission::create(['name'=>'assign_module_view']);
        Permission::create(['name'=>'assign_module_access']);

        Permission::create(['name'=>'user_create']);
        Permission::create(['name'=>'user_edit']);
        Permission::create(['name'=>'user_delete']);
        Permission::create(['name'=>'user_view']);
        Permission::create(['name'=>'user_access']);

        Permission::create(['name'=>'role_create']);
        Permission::create(['name'=>'role_edit']);
        Permission::create(['name'=>'role_delete']);
        Permission::create(['name'=>'role_view']);
        Permission::create(['name'=>'role_access']);

        Permission::create(['name'=>'assign_permission_create']);
        Permission::create(['name'=>'assign_permission_edit']);
        Permission::create(['name'=>'assign_permission_delete']);
        Permission::create(['name'=>'assign_permission_view']);
        Permission::create(['name'=>'assign_permission_access']);
    }
}
