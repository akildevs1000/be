<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Employee extends Model
{
    use HasFactory;

    protected $with = ["user","department","designation"];

    protected $guarded = [];

    protected $casts = [
        'joining_date' => 'date:Y/m/d',
        'created_at' => 'datetime:d-M-y',
    ];

    protected $appends = ['show_joining_date','edit_joining_date','full_name'];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function designation(){
        return $this->belongsTo(Designation::class);
    }

    public function Department(){
        return $this->belongsTo(Department::class);
    }

    public function getProfilePictureAttribute($value)
    {
        if(!$value){
            return null;
        }
        return asset('media/employee/profile_picture/' . $value);
    }

    public function getCreatedAtAttribute($value): string
    {
        return date('d M Y',strtotime($value));
    }

    public function getShowJoiningDateAttribute(): string
    {
        return date('d M Y',strtotime($this->joining_date));
    }

    public function getEditJoiningDateAttribute(): string
    {
        return date('Y-m-d',strtotime($this->joining_date));
    }
    public function getFullNameAttribute(): string
    {
        return $this->first_name . " " . $this->last_name;
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
