<?php

namespace App\Http\Requests\AssignModule;

use Illuminate\Foundation\Http\FormRequest;
use App\Traits\failedValidationWithName;

class UpdateRequest extends FormRequest
{
	use failedValidationWithName; // gives response when validation failed

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'company_id' => 'required',
        ];
    }
	public function messages()
    {
        return [
            'company_id.required' => 'The role field is required',
        ];
    }

}
