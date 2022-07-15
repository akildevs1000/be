<?php

namespace App\Http\Requests\Company;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;

class CompanyRequest extends FormRequest
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
            'logo'=>['image','mimes:jpeg,png,jpg,svg','max:2048','sometimes','nullable'],
        ];
    }
}
