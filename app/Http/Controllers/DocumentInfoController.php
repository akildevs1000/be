<?php

namespace App\Http\Controllers;

use App\Models\DocumentInfo;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Http\Request;

class DocumentInfoController extends Controller
{

    public function store(DocumentInfo $DocumentInfo, Request $request)
    {
        // $this->cleanRecord($request->employee_id);
        $arr = [];
            foreach ($request->items as $item) {
                $arr[] = [
                    "title" => $item["title"],
                    "attachment" => $this->saveFile($item["file"], $request->employee_id),
                    "employee_id" => $request->employee_id,
                    "company_id" => $request->company_id,
                ];
            }

        try {

            return response()->json([
                "status" => true,
                "message" => "Record has been successfully added",
                "record" => DocumentInfo::insert($arr),
            ]);

        } catch (\Throwable $th) {
            return response()->json([
                "status" => true,
                "message" => $th,
                "record" => null,
            ]);
        }

    }

    public function show(DocumentInfo $DocumentInfo, $id)
    {
        return $DocumentInfo->where('employee_id', $id)->get();
    }

    public function saveFile($file, $id)
    {
        $filename = $file->getClientOriginalName();
        $file->move(public_path('documents/' . $id . "/"), $filename);
        return $filename;
    }

    public function cleanRecord($id)
    {
        $file = new Filesystem;
        DocumentInfo::where('employee_id', $id)->delete() ?? null;
        return $file->cleanDirectory('documents/' . $id . "/");
    }

    public function destroy($id)
    {
        $record = DocumentInfo::find($id);
        
        if ($record->delete()) {
            return response()->json([
                "status" => true,
                "message" => "Record has been successfully deleted",
                "record" => null,
            ]);

        } else {
            return response()->json([
                "status" => false,
                "message" => "Record cannot delete",
                "record" => null,
            ]);

        }

    }
}
