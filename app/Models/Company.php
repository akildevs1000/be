<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;


class Company extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $hidden =[
        'password','updated_at'
    ];
    protected $dates =[
      'member_from','expiry'
    ];

    protected $casts = [
        'member_from' => 'date:Y/m/d',
        'expiry' => 'date:Y/m/d',
        'created_at' => 'datetime:d-M-y',
    ];
    protected $appends = ['show_member_from','show_expiry'];

    public function contact(){
        return $this->hasOne(CompanyContact::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function modules(){
        return $this->hasOne(AssignModule::class);
    }

    public function branches(){
        return $this->hasMany(Branch::class);
    }

    public function getLogoAttribute($value)
    {
        if(!$value){
            return null;
        }
        return asset('media/company/logo/' . $value);
    }

    public function getCreatedAtAttribute($value): string
    {
        return date('d M Y',strtotime($value));
    }

    public function getShowMemberFromAttribute(): string
    {
        return date('d M Y',strtotime($this->member_from));
    }

    public function getShowExpiryAttribute(): string
    {
        return date('d M Y',strtotime($this->expiry));
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
