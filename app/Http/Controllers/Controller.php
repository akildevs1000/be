<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function FilterCompanyList($model, $request, $model_name = null)
    {
        $model = $model::query();

        if (is_null($model_name)) {
            $model->when($request->company_id > 0, function ($q) use ($request) {
                return $q->where('company_id', $request->company_id);
            });

            $model->when(!$request->company_id, function ($q) use ($request) {
                return $q->where('company_id', 0);
            });
        }

        // $model->when($request->branch_id > 0, function ($q) use ($request) {
        //     return $q->where('branch_id', $request->branch_id);
        // });

        // $model->when(!$request->branch_id, function ($q) use ($request) {
        //     return $q->where('branch_id', 0);
        // });

        return $model;

    }

    public static function process($action, $job, $model, $id = null)
    {
        try {
            $m = '\\App\\Models\\' . $model;
            $last_id = gettype($job) == 'object' ? $job->id : $id;

            $response = [
                'status' => true,
                'record' => $m::find($last_id),
                'message' => $model . ' has been ' . $action,
            ];

            if ($last_id) {
                return response()->json($response, 200);
            } else {
                return response()->json([
                    'status' => false,
                    'record' => null,
                    'message' => $model . ' cannot ' . $action,
                ], 200);
            }

        } catch (\Throwable$th) {throw $th;}
    }

    public function response($msg, $record, $status)
    {
        return response()->json(['record' => $record, 'message' => $msg, 'status' => $status], 200);
    }

    public function process_search($model, $input, $fields = [])
    {
        $model->where('id', 'LIKE', "%$input%");

        foreach ($fields as $key => $value) {
            if (is_string($value)) {
                $model->orWhere($value, 'LIKE', "%$input%");
            } else {
                foreach ($value as $relation_value) {
                    $model->orWhereHas($key, function ($query) use ($input, $relation_value) {
                        $query->where($relation_value, 'like', '%' . $input . '%');
                    });
                }
            }
        }
        return $model;
    }
}
