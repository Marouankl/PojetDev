<template>
  <div>
    <h2>Liste des Livres</h2>
    <ul v-if="books.length > 0">
      <li v-for="book in books" :key="book.book_id">
        {{ book.title }}
        {{ book.discription }}
        {{ book.images }}

      </li>
    </ul>
    <p v-else-if="loading">Chargement...</p>
    <p v-else>Aucun livre trouvé.</p>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';

const books = ref([]);
const loading = ref(false);

const fetchBooks = async () => {
  loading.value = true;
  try {
    const response = await fetch('https://your-api-gateway-url.com/books');
    if (!response.ok) {
      throw new Error('Failed to fetch books');
    }
    books.value = await response.json();
  } catch (error) {
    console.error('Error fetching books:', error);
  } finally {
    loading.value = false;
  }
};

onMounted(() => {
  fetchBooks();
});
</script>
