<?php

namespace App\Http\Requests\Company;

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
            'logo'=>['image','mimes:jpeg,png,jpg,svg','max:2048','sometimes','nullable'],

            'company_name'=>['required','min:3','max:100'],
            'member_from'=>['required','date'],
            'expiry'=>['required','date'],
            'max_employee'=>['required','integer'],
            'max_devices'=>['required','integer'],
            'location'=>['required','min:3','max:255'],

            'name'=>'required|min:3|max:100',
            'email'=>'required|min:3|max:191|unique:users',
            'password'=>['required','confirmed','min:6','max:25'],

            'contact_name'=>['required','min:3','max:100'],
            'number'=>['required','min:8','max:15'],
            'position'=>['required','min:3','max:100'],
            'whatsapp'=>['required','min:8','max:15'],

        ];
    }


}
