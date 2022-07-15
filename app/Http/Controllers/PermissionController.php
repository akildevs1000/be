<?php

namespace App\Http\Controllers;

use App\Http\Requests\Permission\PermissionRequest;
use App\Http\Requests\Permission\PermissionUpdateRequest;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use App\Models\Permission;

class PermissionController extends Controller
{
    public function index(Permission $model, Request $request)
    {
        return $this->FilterCompanyList($model, $request)->get();
    }

    public function store(PermissionRequest $request)
    {
        try {
            $record = Permission::create($request->all());
        } catch (\Throwable $th) {
            throw $th;
        }

        return Response::json([
            'record' => $record,
            'message' => 'Permission Successfully created.',
            'status' => true,
        ], 200);
    }

    public function show($id): JsonResponse
    {
        $record = Permission::findById($id);
        return Response::json([
            'record' => $record,
            'status' => true,
            'message' => null,
        ], 200);
    }

    public function update(PermissionUpdateRequest $request, Permission $Permission): JsonResponse
    {
        try {
            $Permission->update($request->all());
            return Response::json([
                'record' => $Permission,
                'message' => 'Permission Successfully updated.',
                'status' => true,
            ], 200);


        } catch (\Throwable $th) {
            throw $th;
        }
       
    }

    public function destroy($id)
    {
        $record = Permission::find($id);
        if ($record->delete()) {
            return Response::noContent(204);
        } else {
            return Response::json(['message' => 'Permission assigned to some users please check those.'], 404);
        }

    }

    public function permissions($id): JsonResponse
    {
        $record = User::with('permissions')->find($id);
        return Response::json([
            'record' => $record,
            'status' => true,
            'message' => null,
        ], 200);
    }

    public function search(Request $request, $key)
    {
        $query = Permission::query();

        $model = $this->FilterCompanyList($query, $request);

        $model->where('id', 'LIKE', "%$key%");

        $model->orWhere('name', 'LIKE', "%$key%");

        return $model->get();
    }

    public function deleteSelected(Request $request)
    {
        $record = Permission::whereIn('id', $request->ids);
        if ($record->delete()) {
            return Response::json([
                'status' => true,
                'message' => null,
            ], 200);
        } else {
            return Response::json(['message' => 'Role assigned to some users please check those.'], 404);
        }

    }
}
