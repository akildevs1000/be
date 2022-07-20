<?php

namespace App\Http\Controllers;

use App\Http\Requests\Module\ModuleAssignRequest;
use App\Http\Requests\Module\StoreRequest;
use App\Http\Requests\Module\UpdateRequest;
use App\Models\Company;
use App\Models\CompanyModule;
use App\Models\Module as Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ModuleController extends Controller
{
    public function index(Request $request,Model $model)
    {
        return $model->paginate($request->per_page);
    }

    public function store(StoreRequest $request,Model $model)
    {
        try {
            $record = $model->create($request->validated());

            if ($record) {
                return $this->response('Module successfully added.',$record, true);
            } else {
                return $this->response('Module cannot add.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function search(Model $model, Request $request,$key)
    {
        $model = Model::query();

        $fields = ['name'];

        $model = $this->process_search($model, $key, $fields);

        return $model->paginate($request->per_page);
    }
}
