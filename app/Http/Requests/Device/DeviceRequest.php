<?php

namespace App\Http\Requests\Device;

use App\Traits\failedValidationWithName;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class DeviceRequest extends FormRequest
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
            'name' => ['required','min:3','max:190'],
            'device_id' => ['required','min:3','max:190','unique:devices'],
            'location' => ['required','min:3'],
            'company_id' => ['required','min:1','integer'],
            'status_id' => ['required','min:1','integer']
        ];
    }
}
