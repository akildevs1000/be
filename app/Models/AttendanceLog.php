<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttendanceLog extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $appends = [
        // 'hours'
    ];

    protected $casts = [
        // 'LogTime' => 'datetime:d-M-y h:i:s:a',
    ];

    // protected static function boot()
    // {
    //     parent::boot();

    //     // Order by name ASC
    //     static::addGlobalScope('order', function (Builder $builder) {
    //         $builder->orderBy('id', 'asc');
    //     });
    // }

    public function device()
    {
        return $this->belongsTo(Device::class, "DeviceID", "device_id");
    }

    public function employee()
    {
        return $this->belongsTo(Employee::class, 'UserID', 'employee_id');
    }
}
