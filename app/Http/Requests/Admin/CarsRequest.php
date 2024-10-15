<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class CarsRequest extends FormRequest
{
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
     * @return array
     */
    public function rules()
    {
        $carId = $this->route('car');

        return [
            'name'              => 'sometimes|required|string|max:100|unique:cars,name,' . $carId. ',id,deleted_at,NULL',
            'description'       => 'nullable|string|max:100',
            'license_plate'     => 'nullable|string',
            'photo'             => 'nullable|image|max:2048',
        ];
    }
}
