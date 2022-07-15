<?php

namespace App\Http\Controllers;

use App\Http\Requests\PersonalInfo\StoreRequest;
use App\Models\PersonalInfo;

class PersonalInfoController extends Controller
{
    public function store(PersonalInfo $model, StoreRequest $request)
    {
        try {
            $record = $model->updateOrCreate(['employee_id' => $request->employee_id], $request->all());

            return response()->json([
                "status" => true,
                "message" => "Record has been successfully added",
                "record" => $record,
            ]);

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show(PersonalInfo $model,$id)
    {
        return $model->whereEmployeeId($id)->first();
    }
}
