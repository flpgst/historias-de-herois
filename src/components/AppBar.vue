<template>
  <v-app-bar
    class="d-flex justify-end align-center"
    flat
    outlined
    :color="$vuetify.theme.dark ? 'deep-purple' : 'orange'"
    app
  >
    <v-tooltip bottom>
      <template v-slot:activator="{ on }">
        <v-btn
          v-on="on"
          fab
          depressed
          :x-small="$vuetify.breakpoint.smAndDown"
          :small="$vuetify.breakpoint.mdAndUp"
          @click="toggleDarkTheme()"
          class="d-flex align-center align-content-center"
          :color="$vuetify.theme.dark ? 'deep-purple lighten-1' : 'amber light-1'"
        >
          <v-icon :color="$vuetify.theme.dark ? 'orange lighten-2' : 'purple lighten-1'">{{
            $vuetify.theme.dark ? "mdi-weather-sunny" : "mdi-weather-night"
          }}</v-icon>
        </v-btn>
      </template>
      {{ $vuetify.theme.dark ? "Modo Claro" : "Modo Escuro" }}
    </v-tooltip>
  </v-app-bar>
</template>

<script>
export default {
  name: "AppBar",
  methods: {
    toggleDarkTheme() {
      this.$vuetify.theme.dark = !this.$vuetify.theme.dark;
      console.log(this.$vuetify.theme.dark);
    },
  },
};
</script>

<style>
.app-bar-color {
  background: rgb(136, 41, 255);
  background: linear-gradient(45deg, red 10%, #0376f2 20%, rgba(136, 41, 255, 1) 80%, red 90%);
}
</style>
