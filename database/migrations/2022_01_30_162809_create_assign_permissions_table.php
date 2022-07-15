<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssignPermissionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return voida
     */
    public function up()
    {
        Schema::create('assign_permissions', function (Blueprint $table) {
            $table->id();
			$table->integer('role_id');
			$table->json('permission_ids');
			$table->json('permission_names');
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
        Schema::dropIfExists('assign_permissions');
    }
}
