<?php

namespace App\Http\Requests\Employee;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;

class EmployeeOtherRequest extends FormRequest
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
            'employee_id'=>['required'],
            'joining_date'=>['required','date'],
            'department_id'=>['required'],
            'designation_id'=>['required'],

        ];
    }
}
