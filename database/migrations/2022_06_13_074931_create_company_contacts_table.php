<?php

use App\Models\Company;
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
        Schema::create('company_contacts', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(Company::class,'company_id')->index();
            $table->string('name');
            $table->string('number');
            $table->string('position');
            $table->string('whatsapp');
            $table->timestamps();

            $table->foreign("company_id")->references("id")->on("companies")->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('company_contacts');
    }
};
