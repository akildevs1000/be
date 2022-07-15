<?php

namespace App\Http\Requests\PersonalInfo;

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
            "passport_no" => "nullable|min:6|max:20",
            "tel" => "nullable|min:10|max:13",
            "nationality" => "nullable|min:10|max:20",
            "religion" => "nullable|min:3|max:20",
            "marital_status" => "nullable|min:3|max:15",
            "no_of_spouse" => "nullable|min:1|max:50",
            "no_of_children" => "nullable|min:1|max:50",
            "employee_id" => "required",
            "company_id" => "required",
        ];
    }
}
