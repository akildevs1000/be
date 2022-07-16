<?php

namespace App\Http\Controllers;

use App\Http\Requests\SalaryType\StoreRequest;
use App\Http\Requests\SalaryType\UpdateRequest;
use App\Models\SalaryType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class SalaryTypeController extends Controller
{
    public function index(SalaryType $model, Request $request)
    {
        return $this->FilterCompanyList($model, $request)->paginate($request->per_page);
    }

    public function store(StoreRequest $request, SalaryType $model)
    {
        try {

            $record = $model->create($request->all());

            if ($record) {
                return $this->response('Salary type successfully added.', null, true);
            } else {
                return $this->response('Salary type cannot add.', null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }

    }

    public function update(UpdateRequest $request, SalaryType $salaryType)
    {
        try {
            $record = $salaryType->update($request->all());

            if ($record) {
                return $this->response('Salary type successfully Updated.', null, true);
            } else {
                return $this->response('Salary type cannot Update.', null, false);
            }

        } catch (\Throwable$th) {
            throw $th;
        }

    }

    public function destroy(SalaryType $model)
    {
        try {
            $record = $model->delete();

            if ($record) {
                return $this->response('Salary type successfully added.', null, true);
            } else {
                return $this->response('Salary type cannot add.', null, false);
            }

        } catch (\Throwable$th) {
            throw $th;
        }
    }

    public function search(Request $request, $key)
    {
        $query = SalaryType::query();

        $model = $this->FilterCompanyList($query, $request);

        $model->where('id', 'LIKE', "%$key%");

        $model->orWhere('name', 'LIKE', "%$key%");

        return $model->paginate($request->per_page);
    }

    public function deleteSelected(SalaryType $model, Request $request)
    {
        try {
            $record = $model->whereIn('id', $request->ids)->delete();

            if ($record) {
                return $this->response('Salary type successfully added.', null, true);
            } else {
                return $this->response('Salary type cannot add.', null, false);
            }

        } catch (\Throwable$th) {
            throw $th;
        }
    }
}
