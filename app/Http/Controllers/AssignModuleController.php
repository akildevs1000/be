<?php

namespace App\Http\Controllers;

use App\Http\Requests\AssignModule\StoreRequest;
use App\Http\Requests\AssignModule\UpdateRequest;

use App\Models\AssignModule as Model;
use App\Models\Company;
use App\Models\Module;
use Illuminate\Http\Request;

class AssignModuleController extends Controller
{
    public function index(Model $model, Request $request)
    {
        return $model->with('company')->paginate($request->per_page);
    }

    public function show(Model $model, $id)
    {
        return $model->with('company')->find($id);
    }
    public function store(StoreRequest $request, Model $model)
    {
        $data = $request->validated();

        $data['module_names'] = Module::whereIn('id', $data['module_ids']  ?? [])->pluck('name');

        return $this->process('added', Model::create($data), class_basename($model));
    }

    public function update(UpdateRequest $request, Model $model, $id)
    {
        $data = $request->validated();

        $query = Module::whereIn('id', $request->module_ids ?? [])->select('id','name')->get()->toArray();

        $data['module_ids'] = array_column($query, 'id');

        $data['module_names'] = array_column($query, 'name');

        return $this->process('updated', $model->whereId($id)->update($data), class_basename($model), $id);
    }

    public function destroy(Model $model, $id)
    {
        return $this->process('deleted', $model::find($id)->delete(), class_basename($model));
    }

    public function search(Model $model, Request $request, $key)
    {
        $model = $this->FilterCompanyList($model, $request);

        $fields = [
            "module_names",
            "company" => ["name"],
        ];

        $model = $this->process_search($model, $key, $fields);

        $model->with('company');

        return $model->paginate($request->per_page);

    }

    public function notAssignedCompanyIds(Model $model, Request $request)
    {
        $rows = $model->get();

        $company_ids = [];

        foreach($rows as $row){
            if(count($row->module_ids)){
                $company_ids[] = $row->company_id;
            }
        }

        return Company::whereNotIn('id', $company_ids)->get();
    }

    public function dsr(Request $request, Model $model)
    {
        try {
            $record = $model->whereIn('id', $request->ids)->delete();

            if ($record) {
                return $this->response('Assign Permission successfully added.',null, true);
            } else {
                return $this->response('Assign Permission cannot add.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
