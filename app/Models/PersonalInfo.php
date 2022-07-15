<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;


class PersonalInfo extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $appends = ['show_passport_expiry'];

    public function getShowPassportExpiryAttribute()
    {
        return date('d M Y',strtotime($this->passport_expiry));
    }

    protected $casts = [
        'passport_expiry' => 'date:Y/m/d',
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
