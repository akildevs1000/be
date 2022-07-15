<?php

namespace App\Http\Controllers;

use App\Http\Requests\Salary\StoreRequest;
use App\Http\Requests\Salary\UpdateRequest;
use App\Models\Salary;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class SalaryController extends Controller
{
    public function index(Salary $model, Request $request)
    {
        return $this->FilterCompanyList($model, $request)->with(['employee','salary_type'])->paginate($request->per_page);
    }

    public function store(Salary $model, StoreRequest $request)
    {
        try {

            $record = $model->create($request->validated());

            if ($record) {
                return $this->response('Salary successfully added.',$record, true);
            } else {
                return $this->response('Salary cannot add.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }

    }

    

    public function show($id): JsonResponse
    {
        return Response::json([
            'record' => Salary::with(['employee','salary_type'])->where('id', $id)->first(),
            'status' => true,
            'message' => null,
        ], 200);
    }

    public function update(UpdateRequest $request, $id)
    {     
        try {
            $record = Salary::whereId($id)->update($request->all());

            if ($record) {
                return $this->response('Salary successfully added.',$record, true);
            } else {
                return $this->response('Salary cannot add.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id)
    {
        $record = Salary::find($id)->delete();
        if ($record) {
            return $this->response('Salary successfully delete.',$record, true);
        } else {
            return $this->response('Salary cannot delete.',null, false);
        }

    }

    public function search(Request $request, $key)
    {
        $model = Salary::query();

        $model
            ->where('id', 'LIKE', "%$key%")
            ->orWhere('amount', 'LIKE', "%$key%")

            ->orWhereHas('employee', function ($query) use ($key) {
                $query->where('name', 'like', '%' . $key . '%');
                $query->orWhere('email', 'like', '%' . $key . '%');
            });

        return $model->with(['employee','salary_type'])->orderBy('id', 'desc')->paginate($request->perPage);
    }
}
