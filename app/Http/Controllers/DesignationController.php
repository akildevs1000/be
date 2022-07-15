<?php

namespace App\Http\Controllers;

use App\Models\Designation;
use App\Http\Requests\Designation\DesignationRequest;
use App\Http\Requests\Designation\DesignationUpdateRequest;
use Illuminate\Http\Request;

class DesignationController extends Controller
{
    public function index(Designation $model, Request $request)
    {
        $model = $this->FilterCompanyList($model, $request);

        $model->with('department');

        return $model->paginate($request->per_page);
    }

    public function designations_by_department(Designation $model, Request $request)
    {
        $model = $this->FilterCompanyList($model, $request);

        $model->where('department_id',$request->department_id);

        $model->with('department');

        return $model->paginate($request->per_page);
    }

    public function search(Designation $model, Request $request, $key)
    {
        $model = $this->FilterCompanyList($model, $request);

        $model->where('id', 'LIKE', "%$key%");

        $model->orWhere('name', 'LIKE', "%$key%");

        $model->with('department');


        return $model->paginate($request->per_page);
    }

    public function store(Designation $model, DesignationRequest $request)
    {
        $data = $request->validated();

        if ($request->company_id) {
            $data["company_id"] = $request->company_id;
        }

        try {
            $record = $model->create($data);

            if ($record) {
                return $this->response('Designation successfully added.',$record, true);
            } else {
                return $this->response('Designation cannot add.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show(Designation $Designation)
    {
        return $Designation;
    }

    public function update(DesignationUpdateRequest $request, Designation $Designation)
    {
        try {
            $record =  $Designation->update($request->validated());

            if ($record) {
                return $this->response('Designation successfully updated.',$Designation, true);
            } else {
                return $this->response('Designation cannot updated.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy(Designation $Designation)
    {
        try {
            $record = $Designation->delete();

            if ($record) {
                return $this->response('Designation successfully deleted.',$Designation, true);
            } else {
                return $this->response('Designation cannot delete.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function deleteSelected(Request $request)
    {
        try {
            $record = Designation::whereIn('id', $request->ids)->delete();

            if ($record) {
                return $this->response('Designation successfully deleted.',null, true);
            } else {
                return $this->response('Designation cannot delete.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
