<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class AssignPermission extends Model
{
    protected $guarded = [];

    protected $casts = [
        'permission_ids' => 'array',
        'permission_names' => 'array',
        'created_at' => 'datetime:d-M-y',
    ];

    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('order', function (Builder $builder) {
            $builder->orderBy('id', 'desc');
        });
    }
}
