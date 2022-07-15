<?php

namespace App\Http\Controllers;

use App\Http\Requests\BankInfo\StoreRequest;
use App\Models\BankInfo;

class BankInfoController extends Controller
{
    public function store(BankInfo $model, StoreRequest $request)
    {
        $record = $model->updateOrCreate(['employee_id' => $request->employee_id], $request->validated());

        return $this->process('added', $record, class_basename($model));
    }

    public function show(BankInfo $model,$id)
    {
        return $model->whereEmployeeId($id)->first();
    }
}
