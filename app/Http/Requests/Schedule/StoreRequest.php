<?php

namespace App\Http\Requests\Schedule;

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
            'shift_name' => 'required|min:3|max:100|unique:schedules',
            'time_in' => 'required',
            'time_out' => 'required',
            'grace_time_in' => 'required',
            'grace_time_out' => 'required',
            'absent_min_in' => 'required',
            'absent_min_out' => 'required',
            'company_id' => 'required'
        ];
    }

    public function messages()
    {
        return [
            "time_in.required" => "The time in field is required.",
            "time_out.required" => "The time out field is required.",
            "grace_time_in.required" => "The grace time in field is required.",
            "grace_time_out.required" => "The grace time out field is required.",
            "absent_min_in.required" => "The absent minute in time out field is required.",
            "absent_min_out.required" => "The absent minute out time out field is required.",
            "company_id.required" => "The company field is required.",
        ];
    }
}
