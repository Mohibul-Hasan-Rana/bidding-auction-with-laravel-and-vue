<?php

namespace App\Http\Controllers;

use App\Events\AuctionUpdated;
use App\Models\Auction;
use App\Models\Bid;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuctionController extends Controller
{
	public function index()
	{			
			
			$auctions = Auction::where('status', 'active')->get();
			
			return response()->json($auctions);
	}
		
	public function placeBid(Request $request, $auction_id)
	{

		$auction = Auction::find( $auction_id);
		$user = User::find(1);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
        
        if ($user->bids_remaining < 1) {
            return response()->json(['message' => 'You do not have enough bids'], 400);
        }
		
		$auction->update([
			'current_price' => $auction->current_price + 1,
			'current_bidder' => "Mohibul",
		]);
		
        $user->bids_remaining -= 1;
        $user->save();
		
		$bid = Bid::create([
				'auction_id' => $auction->id,
				'bidder_id' => $user->id,
				'amount' => $auction->current_price
			]);

		//broadcast(new AuctionBroadcast($auction)); 

		return response()->json(['auction' => $auction, 'message' => 'Bid placed successfully']);
	}

	public function autoBid(Request $request, $id)
	{
		
		$auction = Auction::find($id);

		if (!$auction) {
			return response()->json(['message' => 'Auction not found'], 404);
		}

		
		/* if ($auction->end_time > now()) {
			$auction->update([
				'current_price' => $auction->current_price + 1,            
			]);

			
			// broadcast(new AuctionUpdated($auction));

			return response()->json(['auction' => $auction]);
		} */
		return response()->json(['auction' => $auction]);
		//return response()->json(['message' => 'No auto bid required'], 400);
	}
}