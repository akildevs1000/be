<?php

use App\Models\Company;
use App\Models\DeviceStatus;
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
        Schema::create('devices', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(Company::class,'company_id')->default(0);
            $table->foreignIdFor(Company::class,'branch_id')->default(0);
            $table->foreignIdFor(DeviceStatus::class,'status_id');
            $table->string('name');
            $table->string('device_id');
            $table->string('location');
            $table->timestamps();

            $table->foreign("company_id")->references("id")->on("companies")->cascadeOnDelete();
            $table->foreign("status_id")->references("id")->on("device_statuses");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('devices');
    }
};
