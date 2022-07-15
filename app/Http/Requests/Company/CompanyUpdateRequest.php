<?php

namespace App\Http\Requests\Company;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Hash;

class CompanyUpdateRequest extends FormRequest
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
//            'name'=>['required','min:3','max:100'],
//            'user_name'=>'required|min:3|max:100'/*|unique:companies,user_name,'*//*.$this->company->id*/,
//            'email'=>'required|min:3|max:191'/*|unique:companies,email,'*//*.$this->company->id*/,
//            'password'=>['required','confirmed','min:6','max:25'],
//            'member_from'=>['required','date'],
//            'expiry'=>['required','date'],
//            'max_employee'=>['required','integer'],
//            'max_devices'=>['required','integer'],
//            'location'=>['required','min:3','max:255'],
//            'logo'=>['image','mimes:jpeg,png,jpg,svg','max:2048'],
//            'contact_name'=>['required','min:3','max:100'],
//            'contact_no'=>['required','min:8','max:15'],
//            'contact_position'=>['required','min:3','max:100'],
//            'contact_whatsapp'=>['required','min:8','max:15'],
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
