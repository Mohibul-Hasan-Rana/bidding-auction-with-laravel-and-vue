<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Auction extends Model
{
    protected $fillable = [
        'title', 
        'description', 
        'retail_price', 
        'current_price', 
		'current_bidder',
        'end_time',
		'status',
    ];
}
