<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class AssignModule extends Model
{
    protected $guarded = [];

    protected $casts = [
        'module_ids' => 'array',
        'module_names' => 'array',
        'created_at' => 'datetime:d-M-y',
    ];

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    protected static function boot()
    {
        parent::boot();

        // Order by name ASC
        static::addGlobalScope('order', function (Builder $builder) {
            $builder->orderBy('id', 'desc');
        });
    }
}
