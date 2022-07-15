<?php

use App\Models\Company;
use App\Models\User;
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
        Schema::create('branches', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(Company::class,'company_id')->index();
            $table->foreignIdFor(User::class,'user_id')->default(null)->nullable()->index();
            $table->string('name');
            $table->date('member_from');
            $table->date('expiry');
            $table->integer('max_employee');
            $table->integer('max_devices');
            $table->string('location');
            $table->string('logo')->default(null)->nullable();
            $table->timestamps();

            $table->foreign("company_id")->references("id")->on("companies")->cascadeOnDelete();
            $table->foreign("user_id")->references("id")->on("users")->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('branches');
    }
};
