<?php

namespace App\Http\Requests\NoShift;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
{
    use failedValidationWithName;
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */

    public function rules()
    {
        return [
            'employee_ids' => 'array|min:1',
            'company_id' => 'required',
        ];
    }

    public function messages()
    {
        return [
            "company_id.required" => "The company field is required.",
            "employee_ids.min" => "Atleast 1 employee must be selected.",
        ];
    }

}
