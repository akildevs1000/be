<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;

class DutyOrganizerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $model = Employee::query();
        $model->where("isAutoShift", 0);
        $model->where("company_id", $request->company_id);
        $model->with(["department", "designation"]);
        return $model->paginate($request->per_page);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        try {
            $ids = $request->employee_ids;

            $model = Employee::query();
            $model->whereIn("employee_id", $ids);
            $model->where("isAutoShift", 1);
            $record = $model->update(['isAutoShift' => 0]);

            if ($record) {
                return $this->response('Employee has been added.', null, true);
            }
            return $this->response('Employee cannot add.', null, true);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $model = Employee::query();
            $model->where("id", $id);
            $record = $model->update(["isAutoShift" => 1]);

            if ($record) {
                return $this->response('Employee has been delete.', null, true);
            }
            return $this->response('Employee cannot delete.', null, false);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function deleteSelected(Employee $model, Request $request)
    {
        try {
            $model = $model->query();
            $model->whereIn("id", $request->ids);
            $model->where("isAutoShift", 0);
            $record = $model->update(['isAutoShift' => 1]);

            if ($record) {
                return $this->response('Employee successfully deleted.',$record, true);
            } else {
                return $this->response('Employee cannot delete.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
