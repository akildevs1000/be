<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class DeviceStatus extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function devices(){
        return $this->belongsToMany(Device::class);
    }

    protected $casts = [
        'created_at' => 'datetime:d-M-y',
    ];

    protected static function boot()
    {
        parent::boot();

        // Order by name ASC
        static::addGlobalScope('order', function (Builder $builder) {
            $builder->orderBy('id', 'desc');
        });
    }
}
