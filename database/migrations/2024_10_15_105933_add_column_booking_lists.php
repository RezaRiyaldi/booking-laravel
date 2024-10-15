<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnBookingLists extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('booking_lists', function (Blueprint $table) {
            $table->string('applicant_name')->nullable()->after('status');
            $table->string('applicant_phone')->nullable()->after('applicant_name');
            $table->string('dept')->nullable()->after('applicant_phone');
            $table->string('passenger_name')->nullable()->after('dept');
            $table->string('passenger_phone')->nullable()->after('passenger_name');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('booking_lists', function (Blueprint $table) {
            $table->dropColumn([
                'applicant_name',
                'applicant_phone',
                'dept',
                'passenger_name',
                'passenger_phone'
            ]);
        });
    }
}
