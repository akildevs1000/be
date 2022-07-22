<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AssignModule;
use App\Models\Department;
use App\Models\Employee;
use App\Models\Device;

class CountController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $id = $request->company_id ?? 0;

        return [
            [
                "title" => "TOTAL MODULES",
                "value" => AssignModule::whereCompanyId($id)->count(),
                "icon" => "mdi-apps",
            ],
            [
                "title" => "TOTAL Department",
                "value" => Department::whereCompanyId($id)->count(),
                "icon" => "mdi-door",
            ],
            [
                "title" => "TOTAL Employee",
                "value" => Employee::whereCompanyId($id)->count(),
                "icon" => "mdi-account",
            ],
            [
                "title" => "TOTAL Device",
                "value" => Device::whereCompanyId($id)->count(),
                "icon" => "mdi-laptop",
            ]
        ];
    }
}
