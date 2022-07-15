<?php

namespace App\Http\Requests\Salary;

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
            'employee_id'=>'required|unique:salaries',
            'salary_type_id'=>'required',
            'amount'=>'required',
            'company_id' => 'required'
        ];
    }

    public function messages()
    {
        return [
            "employee_id.required" => "The employee field is required.",
            "employee_id.unique" => "The employee has already been taken.",
            "company_id.required" => "The company field is required.",

        ];
    }
}
