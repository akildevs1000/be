<?php

namespace App\Http\Controllers;

use App\Http\Requests\Device\DeviceStatusRequest;
use App\Models\DeviceStatus;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class DeviceStatusController extends Controller
{

    public function index(Request $request)
    {
        return  DeviceStatus::orderByDesc('id')->paginate($request->per_page);
    }

    public function store(DeviceStatusRequest $request): JsonResponse
    {
        $data = $request->all();
        $record = DeviceStatus::create($data);
        return Response::json([
            'record'=> $record,
            'message'=>'Status successfully created.',
            'status'=>true
        ],200);
    }

    public function show($id)
    {
        $record = DeviceStatus::find($id);
        return Response::json([
            'record'=>$record,
            'status'=>true,
            'message'=>null
        ],200);
    }

    public function update(DeviceStatusRequest $request,$id)
    {
        $data = $request->all();
        $record = DeviceStatus::find($id);
        $record->update($data);
        return Response::json([
            'record'=> $record,
            'message'=>'Status successfully updated.',
            'status'=>true
        ],200);
    }

    public function destroy($id)
    {
        $record = DeviceStatus::find($id);
        if ($record->delete())
            return Response::noContent(204);
        else
            return Response::json(['message'=>'No such record found.'],404);
    }

    public function search(Request $request,$key)
    {
        $model = DeviceStatus::query();

        $model
            ->where('id','LIKE',"%$key%")
            ->orWhere('name','LIKE',"%$key%");

        return $model->orderBy('id','desc')->paginate($request->per_page);
    }
    public function deleteSelected(Request $request)
    {
        $record = DeviceStatus::whereIn('id',$request->ids);
        if ($record->delete()){
            return Response::json([
                'status'=>true,
                'message'=>null
            ],200);
        }
        else
            return Response::json(['message'=>'Role assigned to some users please check those.'],404);
    }
}
