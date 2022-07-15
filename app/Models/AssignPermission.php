<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class AssignPermission extends Model
{
    protected $guarded = [];

    // protected $appends = ['permissions_array'];

    // public function getPermissionsArrayAttribute()
    // {
    //     return Permission::whereIn('id', $this->permissions)->select('id', 'name')->get();
    // }

    protected $casts = [
        'permission_ids' => 'array',
        'permission_names' => 'array',
        'created_at' => 'datetime:d-M-y',
    ];

    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    // use Illuminate\Database\Eloquent\Builder;

    protected static function boot()
    {
        parent::boot();

        // Order by name ASC
        static::addGlobalScope('order', function (Builder $builder) {
            $builder->orderBy('id', 'desc');
        });
    }
}
