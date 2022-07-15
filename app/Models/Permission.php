<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Permission extends Model
{
    protected $guarded = [];

    protected $appends = ['date'];

	public function getDateAttribute()
	{
		$d = strtotime($this->created_at);
		return date("d-M-y", $d);
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
