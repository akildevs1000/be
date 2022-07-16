<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use App\Http\Requests\Schedule\StoreRequest;
use App\Http\Requests\Schedule\UpdateRequest;
use Illuminate\Http\Request;


class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Schedule $model, Request $request)
    {
        $model = $this->FilterCompanyList($model, $request);

        return $model->paginate($request->per_page);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Schedule $model, StoreRequest $request)
    {
        try {
            $record = $model->create($request->validated());

            if ($record) {
                return $this->response('Schedule successfully added.',$record, true);
            } else {
                return $this->response('Schedule cannot add.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function show(Schedule $schedule)
    {
        return $schedule;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateScheduleRequest  $request
     * @param  \App\Models\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRequest $request, Schedule $schedule)
    {
        try {
            $record = $schedule->update($request->validated());

            if ($record) {
                return $this->response('Schedule successfully updated.',$schedule, true);
            } else {
                return $this->response('Schedule cannot update.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function destroy(Schedule $schedule)
    {
        try {
            $record = $schedule->delete();

            if ($record) {
                return $this->response('Schedule successfully deleted.',$record, true);
            } else {
                return $this->response('Schedule cannot delete.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function deleteSelected(Schedule $model, Request $request)
    {
        try {
            $record = $model->whereIn('id', $request->ids)->delete();

            if ($record) {
                return $this->response('Schedule successfully deleted.',$record, true);
            } else {
                return $this->response('Schedule cannot delete.',null, false);
            }

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function search(Schedule $model, Request $request, $key)
    {
        $model = $this->FilterCompanyList($model, $request);

        $model->where('id', 'LIKE', "%$key%");

        $model->orWhere('shift_name', 'LIKE', "%$key%");
        $model->orWhere('time_in', 'LIKE', "%$key%");
        $model->orWhere('time_out', 'LIKE', "%$key%");
        $model->orWhere('grace_time_in', 'LIKE', "%$key%");
        $model->orWhere('grace_time_out', 'LIKE', "%$key%");

        return $model->paginate($request->per_page);
    }
}
