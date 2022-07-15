<?php

namespace App\Http\Controllers;

use App\Http\Requests\User\StoreRequest;
use App\Http\Requests\User\UpdateRequest;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(User $model, Request $request)
    {
        $model = $this->FilterCompanyList($model, $request);

        $model->whereHas('role', function ($query) {
            $query->where('name', 'not like', '%company%');
        });

        $model->with("role:id,name");

        return $model->paginate($request->per_page);
    }
    public function store(User $model, StoreRequest $request)
    {
        try {
            $data = $request->validated();
            $data["password"] = \Hash::make($data["password"]);

            if ($request->company_id) {
                $data["company_id"] = $request->company_id;
            }

            $record = $model->create($data);

            if ($record) {
                return $this->response('User successfully added.', $record, true);
            } else {
                return $this->response('User cannot add.', null, false);
            }

        } catch (\Throwable$th) {
            throw $th;
        }
    }

    public function update(User $model, UpdateRequest $request)
    {
        try {
            $data = $request->validated();

            if ($request->password) {
                $data["password"] = \Hash::make($data["password"]);
            }

            $record = $model->create($data);

            if ($record) {
                return $this->response('User successfully updated.', $record, true);
            } else {
                return $this->response('User cannot update.', null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show(User $User)
    {
        return $User;
    }

    public function destroy(User $model)
    {
        try {
            $record = $model->delete();

            if ($record) {
                return $this->response('User successfully deleted.', null, true);
            } else {
                return $this->response('User cannot delete.', null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function deleteSelected(User $model, Request $request)
    {
        try {
            $record = $model->whereIn('id', $request->ids);

            if ($record) {
                return $this->response('Select record successfully deleted.', null, true);
            } else {
                return $this->response('Select record cannot delete.', null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
