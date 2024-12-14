<template>
  <div class="flex justify-center mb-6">
    <!-- Input Field -->
    <input
      type="text"
      class="w-1/3 p-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
      placeholder="Search Repositories"
      v-model="localQuery"
      @keydown.enter="searchRepositories"
    />

    <!-- Search Button -->
    <button
      @click="searchRepositories"
      class="ml-4 p-2 bg-indigo-500 text-white rounded-md hover:bg-indigo-600 transition"
    >
      Search
    </button>
  </div>
</template>

<script>
export default {
  props: {
    query: {
      type: String,
      required: true,
    },
  },
  emits: ["updateQuery", "searchRepositories"],
  data() {
    return {
      localQuery: this.query,
    };
  },
  watch: {
    // Sync the parent query prop with the localQuery
    localQuery(newQuery) {
      this.$emit("updateQuery", newQuery);
    },
  },
  methods: {
    searchRepositories() {
      this.$emit("searchRepositories", 1); // Trigger search with page 1
    },
  },
};
</script>
