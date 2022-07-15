<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Http\Requests\Department\DepartmentRequest;
use App\Http\Requests\Department\DepartmentUpdateRequest;
use Illuminate\Http\Request;

class DepartmentController extends Controller
{
    public function index(Request $request, Department $model)
    {

        $model = $this->FilterCompanyList($model, $request);

        $model->with('company');

        return $model->paginate($request->per_page);
    }

    public function search(Department $model, Request $request, $key)
    {
        $model = $this->FilterCompanyList($model, $request);

        $model->where('id', 'LIKE', "%$key%");

        $model->orWhere('name', 'LIKE', "%$key%");

        return $model->paginate($request->per_page);
    }

    public function store(Department $model, DepartmentRequest $request)
    {
        $data = $request->validated();

        if ($request->company_id) {
            $data["company_id"] = $request->company_id;
        }
        try {
            $record = $model->create($data);

            if ($record) {
                return $this->response('Department successfully added.',$record, true);
            } else {
                return $this->response('Department cannot add.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show(Department $Department)
    {
        return $Department;
    }

    public function update(DepartmentUpdateRequest $request, Department $Department)
    {
        try {
            $record = $Department->update($request->validated());

            if ($record) {
                return $this->response('Department successfully updated.',$Department, true);
            } else {
                return $this->response('Department cannot update.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy(Department $Department)
    {
        try {
            $record = $Department->delete();

            if ($record) {
                return $this->response('Department successfully deleted.',$record, true);
            } else {
                return $this->response('Department cannot delete.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function deleteSelected(Department $model, Request $request)
    {
        try {
            $record = $model->whereIn('id', $request->ids)->delete();

            if ($record) {
                return $this->response('Department successfully deleted.',$record, true);
            } else {
                return $this->response('Department cannot delete.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
