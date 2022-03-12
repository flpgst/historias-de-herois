<template>
  <v-app :style="{ background: $vuetify.theme.themes[theme].background }">
    <app-bar></app-bar>
    <v-main class="my-6 mx-4">
      <router-view />
    </v-main>
    <v-footer>
      <v-btn text plain href="https://github.com/flpgst/historias-de-herois/wiki" target="_blank">
        <v-icon class="mr-1">mdi-cloud-upload</v-icon>
        Contribua com histórias
      </v-btn>
      <v-spacer></v-spacer>
      <v-btn text plain href="https://www.instagram.com/flpgst/" target="_blank">
        Entre em contato
        <v-icon class="ml-1">mdi-instagram</v-icon>
      </v-btn>
      <v-btn icon href="https://github.com/flpgst/historias-de-herois" target="_blank">
        <v-icon>mdi-github</v-icon>
      </v-btn>
    </v-footer>
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
