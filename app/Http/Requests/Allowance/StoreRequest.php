<?php

namespace App\Http\Requests\Allowance;

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
            "items" => "required|array|min:1",
            "items.*.title" => "required|string|min:4|max:100",
            "items.*.amount" => "required",           
            "employee_id" => "required",           
            "company_id" => "required",           
        ];
    }
}
