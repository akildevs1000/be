<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->string('first_name')->nullable();
            $table->string('last_name')->nullable();
            $table->string('profile_picture')->nullable();
            $table->string('phone_number')->nullable();
            $table->string('whatsapp_number')->nullable();
            $table->string('phone_relative_number')->nullable();
            $table->string('whatsapp_relative_number')->nullable();
            $table->string('employee_id')->nullable();
            $table->date('joining_date')->nullable();
            $table->integer('designation_id')->nullable();
            $table->integer('department_id')->nullable();
            $table->integer('user_id')->nullable();

            $table->integer('company_id')->default(0);
            $table->integer('branch_id')->default(0);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('employees');
    }
};
