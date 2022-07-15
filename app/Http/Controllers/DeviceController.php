<?php

namespace App\Http\Controllers;

use App\Http\Requests\Device\StoreRequest;
use App\Http\Requests\Device\UpdateRequest;
use App\Models\Device;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class DeviceController extends Controller
{
    public function index(Device $model, Request $request)
    {
        return $model->with(['status', 'company'])->paginate($request->per_page);
    }

    public function store(Device $model, StoreRequest $request)
    {
        try {
            $record = $model->create($request->validated());

            if ($record) {
                return $this->response('Device successfully added.',$record, true);
            } else {
                return $this->response('Device cannot add.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show(Device $model, $id)
    {
        return $model->with(['status', 'company'])->find($id);

    }

    public function update(Device $Device, UpdateRequest $request)
    {
        try {
            $record = $Device->update($request->validated());

            if ($record) {
                return $this->response('Device successfully updated.',$record, true);
            } else {
                return $this->response('Device cannot update.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy(Device $Device)
    {
        try {
            $record = $Device->delete();

            if ($record) {
                return $this->response('Device successfully deleted.',$record, true);
            } else {
                return $this->response('Device cannot delete.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function search(Request $request, $key)
    {
        $model = Device::query();

        $fields = [
            'name', 'device_id', 'location',
            'status' => ['name'],
            'company' => ['name'],
        ];

        $model = $this->process_search($model, $key, $fields);

        $model->with(['status', 'company']);

        return $model->paginate($request->per_page);
    }
    public function deleteSelected(Device $model, Request $request)
    {
        try {
            $record = $model->whereIn('id', $request->ids)->delete();

            if ($record) {
                return $this->response('Device successfully deleted.',$record, true);
            } else {
                return $this->response('Device cannot delete.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
