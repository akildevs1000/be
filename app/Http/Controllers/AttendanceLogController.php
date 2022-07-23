<?php

namespace App\Http\Controllers;

use App\Models\AttendanceLog;
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
                    $header = join(",", $row) . ",company_id";
                    $header = str_replace(" ", "", $header);
                    $header = explode(",", $header);
                } else {
                    $row[] = $request->company_id;
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

        if ($request->type) {
            $model = $this->getFilteredByTimeStamp($model, $request->type);
        }

        return $this->getLogs($model, $request, $id);
    }

    public function AttendanceLogsSearch(AttendanceLog $model, Request $request, $id, $key)
    {

        $model = $model->query();

        $model->where('attendance_logs.company_id', $id);
        if ($request->type) {
            $model = $this->getFilteredByTimeStamp($model, $request->type);
        }
        if ($key) {
            $model = $this->searchWithRelation($model, $key);
        }
        return $this->getLogs($model, $request, $id);
    }

    public function getLogs($model, $request, $id)
    {
        if ($request->no_shift) {
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

        $model->select(
            "attendance_logs.id",
            "attendance_logs.UserID",
            "attendance_logs.LogTime",
            "attendance_logs.DeviceID",
        );
        $model->join('employees as e', 'attendance_logs.UserID', "=", 'e.employee_id');
        $model->where('attendance_logs.company_id', $id);
        $model->where('e.isAutoShift', 0);
        // $model->with(["employee","device"]);
        $data = $model->paginate($request->per_page);

        $group_arr = [];

        foreach ($data as $key => $value) {
            $group_arr[$value->UserID][] = $value;
        }

        $m_sum = 0;

        $holder = [];

        foreach ($group_arr as $key => $value) {
            for ($i = 0; $i < count($value) - 1; $i++) {
                $to = $value[$i]->LogTime;
                $from = $value[$i + 1]->LogTime;

                $to = strtotime($to);
                $from = strtotime($from);

                $current = date("Y-m-d", ($to));
                $next = date("Y-m-d", ($from));

                if ($current == $next) {
                    $difference = ($from - $to) / 60;
                    $m_sum += $difference;

                    $arr[$value[$i]->UserID] = [
                        "hours_mins" => ["h" => intval($m_sum / 60), "m" => intval($m_sum % 60)],
                        "m" => $m_sum,
                        "UserID" => $value[$i]->UserID,
                        "DeviceID" => $value[$i]->DeviceID,
                        "employee" => $value[$i]->employee,
                        "device" => $value[$i]->device,

                    ];

                    // important for debugginh

                    // $arr[]["extras"] = [
                    //     "h" => intval($difference / 60),
                    //     "m" => intval($difference % 60),
                    //     "from" => $value[$i]->LogTime,
                    //     "to" => $value[$i + 1]->LogTime,
                    //     "UserID" => $value[$i]->UserID,
                    // ];
                }

            }
            $m_sum = 0;

        }

        return ["data" => array_values($arr), "total" => count($arr), "type" => $request->type];
    }

    public function autoShift($model, $request, $id)
    {
        $model->select("attendance_logs.*");
        $model->join('employees as e', 'attendance_logs.UserID', "=", 'e.employee_id');
        $model->where('attendance_logs.company_id', $id);
        $model->where('e.isAutoShift', 1);
        // $model->with(["employee","device"]);
        return $model->paginate($request->per_page);
    }
}
