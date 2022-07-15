<?php

namespace App\Http\Controllers;

use App\Http\Requests\Allowance\StoreRequest;
use App\Http\Requests\Allowance\UpdateRequest;
use App\Models\Allowance;

class AllowanceController extends Controller
{
    public function store(StoreRequest $request)
    {
        $items = $request->validated();

        $arr = [];

        foreach ($items["items"] as $item) {
            $arr[] = [
                "title" => $item["title"],
                "amount" => $item["amount"],
                "employee_id" => $items["employee_id"],
                "company_id" => $items["company_id"],
            ];
        }

        try {
            $record = Allowance::insert($arr);

            if ($record) {
                return $this->response('Allowance successfully added.', $record, true);
            } else {
                return $this->response('Allowance cannot add.', null, false);
            }

        } catch (\Throwable$th) {
            throw $th;
        }
    }

    public function show($id)
    {
        return Allowance::whereEmployeeId($id)->get();
    }

    public function update(UpdateRequest $request, Allowance $Allowance)
    {
        try {

            $record = $Allowance->update($request->validated());

            if ($record) {
                return $this->response('Allowance successfully updated.', $record, true);
            } else {
                return $this->response('Allowance cannot update.', null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy(Allowance $Allowance)
    {
        try {
            $record = $Allowance->delete();

            if ($record) {
                return $this->response('Allowance successfully deleted.', $record, true);
            } else {
                return $this->response('Allowance cannot delete.', null, false);
            }
        } catch (\Throwable $th) {
            throw $th;
        }

    }
}
