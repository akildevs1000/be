<?php

namespace App\Http\Controllers;

use App\Models\Commission;
use Illuminate\Http\Request;
use App\Http\Requests\Commission\StoreRequest;
use App\Http\Requests\Commission\UpdateRequest;

class CommissionController extends Controller
{
    public function store(StoreRequest $request)
    {
        $items = $request->validated();

        $arr = [];

        foreach($items["items"] as $item){
            $arr[] = [
                "title" => $item["title"],
                "amount" => $item["amount"],
                "employee_id" => $items["employee_id"],
                "company_id" => $items["company_id"],
            ];
        }


        try {

            $record = Commission::insert($arr);

            if ($record) {
                return $this->response('Commission successfully added.', $record, true);
            } else {
                return $this->response('Commission cannot add.', null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show($id)
    {
        return Commission::whereEmployeeId($id)->get();
    }

    public function update(UpdateRequest $request, Commission $commission)
    {
        try {

            $record = $commission->update($request->validated());

            if ($record) {
                return $this->response('Commission successfully updated.', $record, true);
            } else {
                return $this->response('Commission cannot update.', null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
        return ;
    }
    public function destroy(Commission $commission)
    {
        $record = $commission->delete();

        if ($record) {
            return $this->response('Commission successfully deleted.', $record, true);
        } else {
            return $this->response('Commission cannot delete.', null, false);
        }
    }
}
