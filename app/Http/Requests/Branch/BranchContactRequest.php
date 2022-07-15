<?php

namespace App\Http\Requests\Branch;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;

class BranchContactRequest extends FormRequest
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
            'contact_name'=>['required','min:3','max:100'],
            'contact_no'=>['required','min:8','max:15'],
            'contact_position'=>['required','min:3','max:100'],
            'contact_whatsapp'=>['required','min:8','max:15']
        ];
    }
}
