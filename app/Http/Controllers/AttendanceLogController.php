<?php

namespace App\Http\Controllers;

use App\Models\AttendanceLog;
use App\Models\Employee;
use App\Models\Schedule;
use Faker\Calculator\Ean;
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
        } catch (\Throwable $th) {
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
            case "monthly":
                return $model->whereMonth('LogTime', date('m'));
            case "yearly":
                return $model->whereYear('LogTime', date('Y'));
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
        if ($request->employee_id) {
            $model->where('e.employee_id', $request->employee_id);
        }
        $model->where('e.isAutoShift', 0);
        $model->with(["employee"]);
        $data = $model->get()->groupBy("UserID")->toArray();

        $data = $this->setData($data);
        return ["data" => array_values($data), "total" => count($data), "type" => $request->type];
    }

    public function autoShift($model, $request, $id)
    {
        $model->select(
            "attendance_logs.id",
            "attendance_logs.UserID",
            "attendance_logs.LogTime",
            "attendance_logs.DeviceID",
        );
        $model->join('employees as e', 'attendance_logs.UserID', "=", 'e.employee_id');
        $model->where('attendance_logs.company_id', $id);
        if ($request->employee_id) {
            $model->where('e.employee_id', $request->employee_id);
        }
        $model->where('e.isAutoShift', 1);
        // $model->with(["employee"]);
        $data = $model->get()->groupBy("UserID")->toArray();

        $schedules = Schedule::orderBy("id", "asc")->get();

        $assignedSchedules = [];

        foreach ($data as $key => $values) {

            $checkIn_time = $values[0]["show_log_time"];

            foreach ($schedules as $schedule) {
                $schedule_time = strtotime($schedule->time_in); //11:00
                if ($checkIn_time < $schedule_time) {
                    $assignedSchedules[$key] = [$schedule, $values];
                    break;
                }
            }
        }
        return $assignedSchedules;

        $data = $this->setData($assignedSchedules);
        return ["data" => array_values($data), "total" => count($data), "type" => $request->type];
    }

    public function setData($data)
    {


        $fomatted_array = [];

        foreach ($data as $value) {
            foreach (array_chunk($value, 2) as $chunk) {
                if (count($chunk) > 1) {
                    $to = $chunk[1]["show_log_time"];
                    $from = $chunk[0]["show_log_time"];

                    $fomatted_array[] = [
                        "checkIn" => date("d-M-y H:i:s a", ($from)),
                        "checkOut" => date("d-M-y H:i:s a", ($to)),
                        "UserID" => $chunk[1]["UserID"],
                        "DeviceID" => $chunk[1]["DeviceID"],
                        "date" => date("Y-m-d", ($to)),
                        "difference" => (($to - $from) / 60),
                        "employee" => $chunk[0]["employee"]
                    ];
                }
            }
        }

        arsort($fomatted_array);

        return array_values($fomatted_array);
    }
}
