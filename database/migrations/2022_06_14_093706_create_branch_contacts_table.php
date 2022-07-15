<?php

use App\Models\Branch;
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
        Schema::create('branch_contacts', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(Branch::class,'branch_id')->index();
            $table->string('name');
            $table->string('number');
            $table->string('position');
            $table->string('whatsapp');
            $table->timestamps();

            $table->foreign("branch_id")->references("id")->on("branches")->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('branch_contacts');
    }
};
