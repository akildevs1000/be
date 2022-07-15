<?php

namespace App\Http\Controllers;

use App\Models\AttendanceLog;
use App\Models\Device;
use Illuminate\Http\Request;

class AttendanceLogController extends Controller
{
    public function index(Request $request)
    {
        return AttendanceLog::paginate($request->per_page);
    }

    public function logsByCompany(Request $request, $id)
    {
        $device_ids = Device::whereCompanyId($id)->pluck('device_id');

        return AttendanceLog::whereIn('DeviceID',$device_ids)->paginate($request->per_page);
    }

    public function searchByCompany(AttendanceLog $model, Request $request, $company_id, $key)
    {
        $fields = [ "UserID", "LogTime", "DeviceID", "SerialNumber" ];

        $device_ids = $this->process_search($model->query(), $key, $fields)->pluck('DeviceID');

        $device_ids = Device::whereIn('device_id',$device_ids)->where('company_id',$company_id)->pluck('device_id');

        return $model->whereIn('DeviceID',$device_ids)->paginate($request->per_page);
    }

    public function search(AttendanceLog $model, Request $request, $key)
    {
        $model = $model->query();

        $fields = [ "UserID", "LogTime", "DeviceID", "SerialNumber" ];

        $model = $this->process_search($model, $key, $fields);

        return $model->paginate($request->per_page);
    }

    public function store(Request $request)
    {
        $file = base_path() . "/logs/OXSAI_timedata_DX.csv";

        if (!file_exists($file)) {
            return [
                'status' => false,
                'message' => 'File doest not exist',
            ];
        }

        $header = null;
        $data = [];

        if (($handle = fopen(base_path() . "/logs/OXSAI_timedata_DX.csv", 'r')) !== false) {
            while (($row = fgetcsv($handle, 1000, ',')) !== false) {

                if (!$header) {
                    $header = join(",", $row);
                    $header = str_replace(" ", "", $header);
                    $header = explode(",", $header);
                } else {
                    $data[] = array_combine($header, $row);
                }

            }
            fclose($handle);
        }

        try {
            AttendanceLog::insert($data);
            unlink(base_path() . "/logs/OXSAI_timedata_DX.csv");
            return AttendanceLog::orderByDesc('id')->paginate($request->per_page);
        } catch (\Throwable$th) {
            throw $th;
        }
    }
}
