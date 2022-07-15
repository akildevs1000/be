<?php

use Illuminate\Support\Facades\File;

function removeFile($path, $file_name){
    $delete=public_path($path.$file_name);
    if (File::isFile($delete)) {
        unlink($delete);
    }
}

function saveFile($request,$destination,$attribute_name = null,$prefix = "",$sufix = "",$imageObj = null,$return_ext = false){
    if (isset($imageObj) && !empty($imageObj) && $attribute_name == null){
        $temp = $imageObj;
        $file = $imageObj->getClientOriginalName();
        $file_ext = $imageObj->getClientOriginalExtension();
        $fileName = pathinfo($file,PATHINFO_FILENAME);
        $image = ((!empty($prefix))?(str_ireplace(" ","-",$prefix)."-"):"").str_ireplace(" ","-",$fileName).((!empty($sufix))?"-".str_ireplace(" ","-",$sufix):"").".".$file_ext;
        $temp -> move($destination,$image);
    }
    else if (isset($attribute_name) && $request -> hasFile($attribute_name) && $attribute_name != null){
        $temp = $request -> file($attribute_name);
        $file = $request->$attribute_name->getClientOriginalName();
        $file_ext = $request->$attribute_name->getClientOriginalExtension();
        $fileName = pathinfo($file,PATHINFO_FILENAME);
        $image = ((!empty($prefix))?(str_ireplace(" ","-",$prefix)."-"):"").str_ireplace(" ","-",$fileName).((!empty($sufix))?"-".str_ireplace(" ","-",$sufix):"").".".$file_ext;
        $temp -> move($destination,$image);
    }

    if ($return_ext){
        return ["name"=>(isset($image))?$image:null,"ext"=>(isset($file_ext))?$file_ext:null];
    }
    return (isset($image))?$image:null;
}
