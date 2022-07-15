<?php

namespace App\Http\Controllers;

use App\Models\Deduction;
use Illuminate\Http\Request;
use App\Http\Requests\Deduction\StoreRequest;
use App\Http\Requests\Deduction\UpdateRequest;

class DeductionController extends Controller
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
                "employee_id" => $items["employee_id"],
                "company_id" => $items["company_id"],
            ];
        }


        try {
            Deduction::insert($arr);

            return response()->json([
                "status"  => true,
                "message" => "Deduction has been added",
                "record"  => Deduction::get()
            ]);

        } catch (\Throwable $th) {
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Deduction  $deduction
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Deduction::whereEmployeeId($id)->get();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Deduction  $deduction
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRequest $request, Deduction $deduction)
    {
        try {

            return response()->json([
                "status"  => true,
                "message" => "Deduction has been added",
                "record"  => $deduction->update($request->validated())
            ]);

        } catch (\Throwable $th) {
            throw $th;
        }
        return ;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Deduction  $deduction
     * @return \Illuminate\Http\Response
     */
    public function destroy(Deduction $deduction)
    {
        if ($deduction->delete()) {
            return response()->json([
                "status"  => true,
                "message" => "Deduction has been deleted",
                "record"  => Deduction::get()
            ]);
        } else {
            return response()->json([
                "status"  => false,
                "message" => "Deduction cannot delete",
                "record"  => null
            ]);
        }
    }
}
