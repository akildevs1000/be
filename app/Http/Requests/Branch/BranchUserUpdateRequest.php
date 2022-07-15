<?php

namespace App\Http\Requests\Branch;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;

class BranchUserUpdateRequest extends FormRequest
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
            'user_name'=>'required|min:3|max:100',
            'email'=>'required|min:3|max:191',
            'password'=>'confirmed'
        ];
    }
}
