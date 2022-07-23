<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Employee>
 */
class EmployeeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            "employee_id" => rand(1,9),
            "first_name" => $this->faker->name,
            "last_name" => $this->faker->name,
            "phone_number" => rand(12345679,98765432),
            "whatsapp_number" => rand(12345679,98765432),
            "phone_relative_number" => rand(12345679,98765432),
            "whatsapp_relative_number" => rand(12345679,98765432),
            "joining_date" => now(),
        ];
    }
}
