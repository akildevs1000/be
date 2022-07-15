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
        Schema::create('bank_infos', function (Blueprint $table) {
            $table->id();
            $table->string("bank_name")->nullable();
            $table->string("account_no")->nullable();
            $table->string("account_title")->nullable();
            $table->string("iban")->nullable();
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
        Schema::dropIfExists('bank_infos');
    }
};
