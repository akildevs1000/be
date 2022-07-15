<?php

namespace App\Http\Controllers;

use App\Models\Overtime;
use Illuminate\Http\Request;
use App\Http\Requests\Overtime\StoreRequest;
use App\Http\Requests\Overtime\UpdateRequest;

class OvertimeController extends Controller
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRequest $request)
    {
        $items = $request->validated();

        $arr = [];

        foreach($items["items"] as $item){
            $arr[] = [
                "title" => $item["title"],
                "amount" => $item["amount"],
                "no_of_hours" => $item["no_of_hours"],
                "no_of_days" => $item["no_of_days"],
                "employee_id" => $items["employee_id"],
                "company_id" => $items["company_id"],
            ];
        }


        try {
            Overtime::insert($arr);

            return response()->json([
                "status"  => true,
                "message" => "Overtime has been added",
                "record"  => Overtime::get()
            ]);

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Overtime  $Overtime
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Overtime::whereEmployeeId($id)->get();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Overtime  $Overtime
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRequest $request, Overtime $Overtime)
    {
        try {

            return response()->json([
                "status"  => true,
                "message" => "Overtime has been added",
                "record"  => $Overtime->update($request->validated())
            ]);

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Overtime  $Overtime
     * @return \Illuminate\Http\Response
     */
    public function destroy(Overtime $Overtime)
    {
        if ($Overtime->delete()) {
            return response()->json([
                "status"  => true,
                "message" => "Overtime has been deleted",
                "record"  => Overtime::get()
            ]);
        } else {
            return response()->json([
                "status"  => false,
                "message" => "Overtime cannot delete",
                "record"  => null
            ]);
        }
    }
}
