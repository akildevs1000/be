<?php

namespace App\Http\Requests\Employee;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Hash;

class EmployeeUpdateRequest extends FormRequest
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
           'user_name'=>'required|min:3|max:100'/*|unique:companies,user_name,'*//*.$this->company->id*/,
           'email'=>'required|min:3|max:191'/*|unique:companies,email,'*//*.$this->company->id*/,
           'password'=>['required','confirmed','min:6','max:25'],
           'profile_picture'=>['image','mimes:jpeg,png,jpg,svg','max:2048']
        ];
    }

    public function setContactFields()
    {

        return [
            'name'  => $this->contact_name,
            'number' => $this->contact_no,
            'position' => $this->contact_position,
            'whatsapp' => $this->contact_whatsapp
        ];

    }

    public function setUserFields()
    {
        return [
            'name'  => $this->user_name,
            'email' => $this->email,
        ];

    }
}
