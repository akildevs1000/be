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
        Schema::create('personal_infos', function (Blueprint $table) {
            $table->id();
            $table->string("passport_no")->nullable();
            $table->string("passport_expiry")->nullable();
            $table->string("tel")->nullable();
            $table->string("nationality")->nullable();
            $table->string("religion")->nullable();
            $table->string("marital_status")->nullable();
            $table->string("no_of_spouse")->nullable();
            $table->string("no_of_children")->nullable();
            $table->string("other_text")->nullable();
            $table->string("other_value")->nullable();
            $table->integer("employee_id");
            $table->integer("company_id")->default(0);
            $table->integer("branch_id")->default(0);
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
        Schema::dropIfExists('personal_infos');
    }
};
