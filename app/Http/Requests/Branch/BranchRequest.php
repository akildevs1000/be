<?php

namespace App\Http\Requests\Branch;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;

class BranchRequest extends FormRequest
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
            'name'=>['required','min:3','max:100'],
            'member_from'=>['required','date'],
            'expiry'=>['required','date'],
            'max_employee'=>['required','integer'],
            'max_devices'=>['required','integer'],
            'location'=>['required','min:3','max:255'],
            'logo'=>['image','mimes:jpeg,png,jpg,svg','max:2048','nullable'],
            'company_id'=>['required','integer','min:1'],
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
