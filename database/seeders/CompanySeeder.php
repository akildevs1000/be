<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Company;
use App\Models\CompanyContact;
use App\Models\Role;
use App\Models\User;


class CompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role = Role::firstOrCreate(['name' => 'company']);

        $user = User::create([
            'name' => "demo company account",
            'password' =>  \Hash::make("secret"),
            'email' =>  "company1@hrms.com",
            'role_id' =>  $role->id,
            'is_master' =>  1,
        ]);

        $company = Company::create([
            'name' => "demo company",
            'member_from' =>  "1982-09-04",
            'expiry' =>  "2012-10-24",
            'max_employee' =>  "10",
            'max_devices' =>  "10",
            'location' =>  "demo location",
            'user_id' => $user->id
        ]);

        $companyContact = CompanyContact::create([
            'company_id' => $company->id,
            'name' =>  "demo contact name",
            'number' =>  "11111111",
            'position' =>  "demo contact position",
            'whatsapp' =>  "22222222",
        ]);
    }
}
