<template>
  <div class="home">
    <h1>Bienvenue sur la page d'accueil</h1>
    <p>{{ message }}</p>
    <router-link to="/books">Livres</router-link>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: "Bienvenue sur notre application Vue.js"
    };
  }
};
</script>

<style scoped>
.home {
  text-align: center;
  margin-top: 60px;
}
</style>
