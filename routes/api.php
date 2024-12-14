<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuctionController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::prefix('auctions')->group(function () {
    Route::get('/', [AuctionController::class, 'index']);  

	Route::post('/{id}/bid', [AuctionController::class, 'placeBid']);
	
	Route::post('/{id}/autoBid', [AuctionController::class, 'autoBid']);
   
});

 