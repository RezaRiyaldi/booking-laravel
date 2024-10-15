<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class UpdateUsersRoleAndAddCarsTable extends Migration
{
    public function up()
    {
        // Update users.role ENUM to include additional roles
        Schema::table('users', function (Blueprint $table) {
            DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('USER', 'ADMIN', 'MANAGER') DEFAULT 'USER'");

            // Add phone column only if it does not exist
            if (!Schema::hasColumn('users', 'phone')) {
                $table->string('phone')->nullable()->after('email');
            }
        });

        // Create cars table
        Schema::create('cars', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('description')->nullable();
            $table->string('photo');
            $table->string('license_plate')->unique();
            $table->timestamps();
            $table->softDeletes();
        });

        // Modify booking_lists table
        Schema::table('booking_lists', function (Blueprint $table) {
            // First, add cars_id
            $table->unsignedBigInteger('cars_id')->nullable()->after('room_id');

            // Add new columns
            $table->boolean('is_overtime')->nullable()->after('cars_id');
            $table->string('destination')->nullable()->after('is_overtime');

            // Modify existing columns
            $table->unsignedBigInteger('room_id')->nullable()->change();  // Make room_id optional
            $table->dateTime('start_time')->change();  // Change start_time to datetime
            $table->dateTime('end_time')->change();  // Change end_time to datetime

            // Add approved_by and approval_date
            $table->unsignedBigInteger('approved_by')->nullable()->after('purpose');
            $table->timestamp('approval_date')->nullable()->after('approved_by');
        });
    }

    public function down()
    {
        // Revert changes to booking_lists
        Schema::table('booking_lists', function (Blueprint $table) {
            $table->dropColumn(['is_overtime', 'destination', 'cars_id', 'approved_by', 'approval_date']);
            $table->date('date');  // Restore the date column
            $table->string('room_id')->nullable(false)->change();  // Revert room_id to non-optional
            $table->time('start_time')->change();  // Revert start_time to original type
            $table->time('end_time')->change();  // Revert end_time to original type
        });

        // Drop cars table
        Schema::dropIfExists('cars');

        // Revert users.role ENUM and drop phone column
        Schema::table('users', function (Blueprint $table) {
            DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('USER', 'ADMIN') DEFAULT 'USER'");  // Change back to original ENUM
            $table->dropColumn('phone');
        });
    }
}
