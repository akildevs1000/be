<?php

namespace App\Http\Controllers;

use App\Models\AttendanceLog;
use App\Models\Employee;
use Illuminate\Http\Request;

class AttendanceLogController extends Controller
{

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

    public function AttendanceLogs(AttendanceLog $model, Request $request, $id)
    {
        $model = $model->query();

        $model->where('attendance_logs.company_id', $id);

        if($request->type){
            $model = $this->getFilteredByTimeStamp($model, $request->type);
        }

        return $this->getLogs($model, $request, $id);
    }

    public function AttendanceLogsSearch(AttendanceLog $model, Request $request, $id, $key)
    {

        $model = $model->query();

        $model->where('attendance_logs.company_id', $id);
        if($request->type){
            $model = $this->getFilteredByTimeStamp($model, $request->type);
        }
        if($key){
            $model = $this->searchWithRelation($model, $key);
        }
        return $this->getLogs($model, $request, $id);
    }

    public function getLogs($model, $request, $id)
    {
        if($request->no_shift){
            return $this->noShift($model, $request, $id);
        }

        return $this->autoShift($model, $request, $id);
    }

    public function searchWithRelation($model, $key)
    {

        $model->WhereHas("employee", function ($q) use ($key) {
            $q->where('employee_id', 'LIKE', "%$key%");
            $q->orWhere('first_name', 'LIKE', "%$key%");
            $q->orWhere('last_name', 'LIKE', "%$key%");

            $q->orWhereHas("department", function ($q) use ($key) {
                $q->where('name', 'LIKE', "%$key%");
                $q->orWhere('name', 'LIKE', "%$key%");
            });

            $q->orWhereHas("designation", function ($q) use ($key) {
                $q->where('name', 'LIKE', "%$key%");
                $q->orWhere('name', 'LIKE', "%$key%");
            });

        });

        $model->orWhereHas("device", function ($q) use ($key) {
            $q->where('name', 'LIKE', "%$key%");
            $q->orWhere('location', 'LIKE', "%$key%");
        });

        return $model;
    }

    public function getFilteredByTimeStamp($model, $type)
    {

        switch ($type) {
            case "daily":
                return $model->whereDate('LogTime', date('Y-m-d'));
                break;
            case "monthly":
                return $model->whereMonth('LogTime', date('m'));
                break;
            case "yearly":
                return $model->whereYear('LogTime', date('Y'));
                break;
            default:
                return $model;
        }
    }

    public function noShift($model, $request, $id)
    {
        $model->select("attendance_logs.*","e.employee_id");
        $model->join('employees as e', 'attendance_logs.UserID', "=", 'e.employee_id');
        $model->where('attendance_logs.company_id', $id);
        $model->where('e.isAutoShift', 0);
        return $model->with(["employee", "device"])->paginate($request->per_page);
    }

    public function autoShift($model, $request, $id)
    {
        $model->select("attendance_logs.*","e.employee_id");
        $model->join('employees as e', 'attendance_logs.UserID', "=", 'e.employee_id');
        // return $model->where('e.isAutoShift', 0)->get();
        return $model->with(["employee", "device"])->paginate($request->per_page);
    }
}
