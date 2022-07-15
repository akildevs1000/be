<?php

namespace App\Http\Requests\Employee;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;

class EmployeeRequest extends FormRequest
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
            'first_name'=>['required','min:3','max:100'],
            'last_name'=>['required','min:3','max:100'],
            'user_name'=>'required|min:3|max:100',
            'email'=>'required|min:3|max:191|unique:users',
            'password'=>['required','confirmed','min:6','max:25'],
            'profile_picture'=>['image','mimes:jpeg,png,jpg,svg','max:2048','sometimes','nullable']           
        ];
    }
}
