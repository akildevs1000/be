<?php

namespace App\Http\Requests\Employee;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;

class EmployeeContactRequest extends FormRequest
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
            'phone_number'=>['required','min:8','max:15'],
            'whatsapp_number'=>['required','min:8','max:15'],
        ];
    }
}
