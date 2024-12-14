<template>
  <div class="flex items-center justify-center  ">
    <div class="container">
      <!-- Auction Header -->
      <h1 class="text-3xl font-bold mb-6 text-center">Live Auctions</h1>

      <!-- Auction List -->
      <div
        class="flex flex-wrap justify-center gap-6"
      >
        <div
          v-for="auction in auctions"
          :key="auction.id"
          class="w-full sm:w-1/2 lg:w-1/3 bg-white shadow-md rounded-lg p-4 border"
        >
          <!-- Auction Title -->
          <h2 class="text-xl font-semibold mb-2">{{ auction.title }}</h2>
          <p class="text-sm text-gray-600 mb-4">{{ auction.description }}</p>

          <!-- Auction Details -->
          <div class="mb-4">
            <div class="flex justify-between">
              <span class="font-semibold">Current Bid:</span>
              <span class="text-green-600 font-bold">${{ auction.current_price }}</span>
            </div>
            <div class="flex justify-between">
              <span class="font-semibold">Highest Bidder:</span>
              <span>{{ auction.current_bidder || 'No bids yet' }}</span>
            </div>
            <div class="flex justify-between">
              <span class="font-semibold">Time Left:</span>
              <span class="text-red-500 font-bold">{{ auction.timeLeft }}s</span>
            </div>
			<div class="flex justify-between">
              <span class="font-semibold">Retail Price:</span>
              <span class="text-green-600 font-bold">${{ auction.retail_price }}</span>
            </div>
			<div v-if="auction.showSuccessMessage" class="mt-2 flex items-center justify-center text-xl text-red-500">
			  Bid placed successfully!
			</div>
          </div>

          <!-- Place Bid Button -->
          <button
            @click="placeBid(auction)"
            :disabled="auction.timeLeft === 0"
            class="w-full bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded"
          >
            Place Bid
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
axios.defaults.baseURL = '/auction/public';
export default {
  data() {
    return {
      auctions: [], 
	  globalTimer: null,
    };
  },
  methods: {
    async fetchAuctions() {
      try {
        const response = await axios.get("/api/auctions");
        this.auctions = response.data.map((auction) => ({
          ...auction,
          timeLeft: 12,
        }));
        
      } catch (error) {
        console.error("Failed to fetch auctions:", error);
      }
    },
    startGlobalTimer() {
      this.globalTimer = setInterval(() => {
        this.auctions.forEach((auction) => {
          if (auction.timeLeft > 0) {
            auction.timeLeft--;
          } else {
            auction.timeLeft = 12; 
            this.updatePrice(auction); 
          }
        });
      }, 1000);
    },
	async updatePrice(auction) {
      try {
        const response = await axios.post(`/api/auctions/${auction.id}/autoBid`, {
          id: auction.id,
        });
        auction.current_price = response.data.auction.current_price;
        auction.current_bidder = response.data.auction.current_bidder;
      } catch (error) {
        console.error("Failed to update auction price:", error);
      }
    },
    async placeBid(auction) {
      try {
        const response = await axios.post(`/api/auctions/${auction.id}/bid`, {
          auction_id: auction.id,
        });

        auction.current_price = response.data.auction.current_price;
        auction.current_bidder = response.data.auction.current_bidder;
        auction.timeLeft = 12;
		auction.showSuccessMessage = true;
		setTimeout(() => {
          auction.showSuccessMessage = false;
        }, 2000);
      } catch (error) {
        console.error("Failed to place bid:", error);
      }
    },
	beforeDestroy() {
		if (this.globalTimer) {
			clearInterval(this.globalTimer);
		}
	},
  },
  mounted() {
    this.fetchAuctions();
	this.startGlobalTimer();
  },
};
</script>

