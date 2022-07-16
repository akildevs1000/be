<?php

namespace App\Http\Controllers;

use App\Http\Requests\AssignPermission\StoreRequest;
use App\Http\Requests\AssignPermission\UpdateRequest;
use App\Models\AssignPermission as Model;
use App\Models\Permission;
use App\Models\Role;
use Illuminate\Http\Request;

class AssignPermissionController extends Controller
{
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
    public function index(Model $model, Request $request)
    {
        return $this->FilterCompanyList($model, $request)->with('role')->paginate($request->per_page);
    }

    public function show(Model $model, $id)
    {
        return $model->find($id);
    }
    public function store(StoreRequest $request, Model $model)
    {
        $data = $request->validated();

        if($request->company_id){
            $data['company_id'] = $request->company_id;
        }

        $data['permission_names'] = Permission::whereIn('id', $data['permission_ids'])->pluck('name');

        return $this->process('added', $model->create($data), class_basename($model));
    }

    public function update(UpdateRequest $request, Model $model, $id)
    {
        $data = $request->validated();

        $data['permission_names'] = Permission::whereIn('id', $data['permission_ids'])->pluck('name');

        return $this->process('updated', $model->whereId($id)->update($data), class_basename($model), $id);
    }

    public function destroy(Model $model, $id)
    {
        return $this->process('deleted', $model::find($id)->delete(), class_basename($model));
    }

    public function search(Model $model, Request $request, $key)
    {
        $model_name = class_basename($model);

        $model = $this->FilterCompanyList($model, $request, $model_name);

        $fields = [
            "permission_names",
            "role" => ["name"],
        ];

        $model = $this->process_search($model, $key, $fields);

        $model->with('role');

        $model->orderByDesc('id');

        return $model->paginate($request->per_page);

    }

    public function notAssignedRoleIds(Model $model, Request $request)
    {
        $ids = $model->pluck('role_id');

        $model = Role::query();

        $model->when($request->company_id > 0, function ($q) use ($request) {
            return $q->where('company_id', $request->company_id);
        });

        $model->when(!$request->company_id, function ($q) use ($request) {
            return $q->where('company_id', 0);
        });

        $model->whereNotIn('id', $ids);

        $model->where('name','!=','company');

        return $model->get();
    }
}
