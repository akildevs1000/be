<?php

use App\Models\Company;
use App\Models\Module;
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
        Schema::create('company_modules', function (Blueprint $table) {
            $table->foreignIdFor(Company::class,'company_id')->index();
            $table->foreignIdFor(Module::class,'module_id')->index();

            $table->foreign("company_id")->references("id")->on("companies")->cascadeOnDelete();
            $table->foreign("module_id")->references("id")->on("modules")->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('company_modules');
    }
};
