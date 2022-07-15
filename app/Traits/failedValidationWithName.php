<?php

namespace App\Traits;

use Illuminate\Foundation\Http\FormRequest;	
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

trait failedValidationWithName {

    protected function failedValidation(Validator $validator) { 
        throw new HttpResponseException(
          response()->json([
            'status' => false,
            'errors' => $validator->errors()
          ], 200)
        ); 
      }
}