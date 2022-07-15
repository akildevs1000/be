<?php

namespace App\Traits;

use Illuminate\Foundation\Http\FormRequest;	
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

trait failedValidation {

    protected function failedValidation(Validator $validator) { 
        throw new HttpResponseException(
          response()->json([
            'status' => false,
            'errors' => $validator->errors()->all()
          ], 200)
        ); 
      }
}