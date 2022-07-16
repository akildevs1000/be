<?php

namespace App\Http\Controllers;

use App\Http\Requests\Role\StoreRequest;
use App\Http\Requests\Role\UpdateRequest;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class RoleController extends Controller
{
    public function index(Role $model, Request $request)
    {
        return $this->FilterCompanyList($model, $request)->where("name", "!=", "company")->paginate($request->per_page);
    }

    public function store(StoreRequest $request)
    {
        try {
            $data = $request->validated();
            if($request->company_id){
                $data['company_id'] = $request->company_id;
            }
            $record = Role::create($data);

            if ($record) {
                return $this->response('Role Successfully created.',$record, true);
            } else {
                return $this->response('Role cannot create.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(UpdateRequest $request, Role $Role)
    {
        try {
            $record = $Role->update($request->all());

            if ($record) {
                return $this->response('Role successfully updated.',$record, true);
            } else {
                return $this->response('Role cannot update.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }

    }

    public function destroy(Role $Role)
    {
        $record = $Role->delete();

        if ($record) {
            return $this->response('Role successfully deleted.',$record, true);
        } else {
            return $this->response('Role cannot delete.',null, false);
        }
    }

    public function roles($id)
    {
        $record = User::with('roles')->find($id);
        return $this->response(null,$record,true, 200);
    }

    public function search(Role $model, Request $request, $key)
    {
        $model = $this->FilterCompanyList($model, $request);

        $fields = [
            'name',
            'location',
            'contact' => ['name','number','position','whatsapp'],
            'user'    => ['name','email']
        ];

        $model = $this->process_search($model, $key, $fields);

        $model->with('contact');

        $model->orderByDesc('id');

        return $model->paginate($request->per_page);

        $model = $this->FilterCompanyList($model, $request);

        $model->where('id', 'LIKE', "%$key%");

        $model->orWhere('name', 'LIKE', "%$key%");

        $model->where("name", "!=", "company");

        return $model->paginate($request->per_page);
    }

    public function searchWithRelation(Role $model, Request $request, $key)
    {
        $model = $this->FilterCompanyList($model, $request);

        $model->where('id', 'LIKE', "%$key%");

        $model->orWhere('name', 'LIKE', "%$key%");

        $model->orWhereHas('permissions', function ($query) use ($key) {
            $query->where('name', 'like', '%' . $key . '%');
        });

        $model->with('permissions');

        return $model->paginate($request->per_page);
    }

    public function assignPermission(Request $request, $id)
    {
        if (is_array($request->role_id)) {
            foreach ($request->role_id as $role_id) {
                $record = Role::findById($role_id);
                $record->syncPermissions($request->permissions);
            }
        } else {
            $record = Role::findById($id);
            $record->syncPermissions($request->permissions);
        }

        return response()->json(204);
    }

    public function getPermission($id)
    {
        $record = Role::with('permissions')->find($id);
        return $this->response(null,$record, true);
    }

    public function deleteSelected(Request $request)
    {
        $record = Role::whereIn('id', $request->ids)->delete();

        if ($record) {
            return $this->response('Role Successfully created.',$record, true);
        } else {
            return $this->response('Role cannot create.',null, false);
        }
    }
}
