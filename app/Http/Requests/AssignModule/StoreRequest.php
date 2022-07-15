<?php

namespace App\Http\Requests\AssignModule;

use Illuminate\Foundation\Http\FormRequest;
use App\Traits\failedValidationWithName;


class StoreRequest extends FormRequest
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
            'module_ids' => 'array|min:1',
        ];
    }
	public function messages()
    {
        return [
            'company_id.required' => 'The company field is required',
            'module_ids.min' => 'Atleast 1 module must be selected'
        ];
    }

}
