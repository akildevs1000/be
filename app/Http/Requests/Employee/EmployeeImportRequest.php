<?php

namespace App\Http\Requests\Employee;

use App\Traits\failedValidation;
use Illuminate\Foundation\Http\FormRequest;

class EmployeeImportRequest extends FormRequest
{
    use failedValidation;
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
            'employees'=> ['required','max:2000',function ($attribute, $value, $fail) {
                if (!in_array($value->getClientOriginalExtension(), ['csv'])) {
                    $fail('The File must by type of csv.');
                }
            }]
        ];
    }

    public function messages()
    {
        return [
            "employees.required" => "File is missing"
        ];
    }
}
