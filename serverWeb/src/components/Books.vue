<template>
    <div>
      <h2>Liste des Livres</h2>
      <ul v-if="books.length > 0">
        <li v-for="book in books" :key="book.book_id" class="book-item">
          <img :src="book.image" alt="Image du livre" class="book-image" />
          <div class="book-details">
            <h3>{{ book.title }}</h3>
            <p><strong>Auteur :</strong> {{ book.author }}</p>
            <p>{{ book.description }}</p>
            <p><strong>Prix :</strong> {{ book.price }} €</p>
          </div>
        </li>
      </ul>
      <p v-else>Aucun livre trouvé.</p>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  
  // Données statiques des livres
  const books = ref([
    {
      book_id: 1,
      title: "Ansible for DevOps",
      author: "Jeff Geerling",
      description: "Learn Ansible automation in a DevOps context.",
      image: "https://m.media-amazon.com/images/I/41CR1l2x5qL.jpg",
      price: 25.99
    },
    {
      book_id: 2,
      title: "Docker Deep Dive",
      author: "Nigel Poulton",
      description: "An in-depth look at Docker and containerization.",
      image: "https://m.media-amazon.com/images/I/51nqWZchm-L.jpg",
      price: 30.50
    },
    {
      book_id: 3,
      title: "Terraform: Up & Running",
      author: "Yevgeniy Brikman",
      description: "Infrastructure as Code with Terraform.",
      image: "https://m.media-amazon.com/images/I/41y-04bKybL.jpg",
      price: 28.75
    }
  ]);
  
  const loading = ref(false);
  
  // Simulation de chargement pour l'effet
  const fetchBooks = async () => {
    loading.value = true;
    setTimeout(() => {
      loading.value = false;
    }, 1000);
  };
  
  onMounted(() => {
    fetchBooks();
  });
  </script>
  
  <style scoped>
  .book-item {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
  }
  
  .book-image {
    width: 100px;
    height: auto;
    margin-right: 20px;
  }
  
  .book-details {
    flex: 1;
  }
  
  .book-details h3 {
    margin: 0 0 10px 0;
  }
  
  .book-details p {
    margin: 5px 0;
  }
  </style>