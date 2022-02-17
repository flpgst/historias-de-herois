<template>
  <v-app :style="{ background: $vuetify.theme.themes[theme].background }">
    <app-bar></app-bar>
    <v-main class="my-6">
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
import AppBar from "@/components/AppBar.vue";

export default {
  name: "App",
  components: {
    AppBar,
  },
  computed: {
    theme() {
      return this.$vuetify.theme.dark ? "dark" : "light";
    },
  },
};
</script>
<style lang="scss">
@import "./assets/styles/variables.scss";
</style>
