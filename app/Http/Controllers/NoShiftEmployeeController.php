<?php

namespace App\Http\Controllers;

use App\Http\Requests\NoShift\StoreRequest;
use App\Http\Requests\NoShift\UpdateRequest;
use App\Models\NoShiftEmployee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NoShiftEmployeeController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(NoShiftEmployee $model, Request $request)
    {
        return $model->with(['employees'])->paginate($request->per_page);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRequest $request)
    {
        $data = $request->validated();
        $arr = [];
        foreach ($data['employee_ids'] as $item) {
            $arr[] = [
                'employee_id' => $item,
                'company_id' => $data['company_id'],
            ];
        }

        $validator = $this->validateData($arr);

        if ($validator->fails()) {
            return [
                "status" => false,
                "custom_errors" => $validator->errors()->all(),
            ];
        }

        try {
            $record = NoShiftEmployee::insert($arr);

            if ($record) {
                return $this->response('Employee added in No Shift.', $record, true);
            } else {
                return $this->response('Employee cannot add.', null, false);
            }
        } catch (\Throwable$th) {
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\NoShiftEmployee  $noShiftEmployee
     * @return \Illuminate\Http\Response
     */
    public function destroy(NoShiftEmployee $model, $id)
    {
        try {
            $record = $model->whereId($id)->delete();

            if ($record) {
                return $this->response('Employee deleted from No Shift.', $record, true);
            } else {
                return $this->response('Employee cannot delete.', null, false);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function deleteSelected(Request $request)
    {
        $record = NoShiftEmployee::whereIn('id', $request->ids)->delete();

        if ($record) {
            return $this->response('Selected employees deleted.', $record, true);
        } else {
            return $this->response('Selected employees cannot delete.', null, false);
        }
    }

    public function search(NoShiftEmployee $model, Request $request,$key)
    {
        $fields = [
            'employees' => ["employee_id","first_name","last_name","phone_number","whatsapp_number"]
        ];

        $model = $this->process_search($model->query(), $key, $fields);

        return $model->with(['employees'])->paginate($request->per_page);
    }

    public function validateData($data)
    {
        return Validator::make($data, [
            '*.employee_id' => ['required', 'unique:no_shift_employees'],
        ]);
    }
}
