<template>
  <v-row>
    <v-col cols="3" class="d-flex justify-center">
      <logo></logo>
    </v-col>
    <v-col cols="6" class="d-flex flex-column align-center justify-center">
      <div class="text-h4">Um lugar com histórias de super-heróis e vilões.</div>
      <div class="text-h6">
        Adaptadas para uma linguagem limpa e acessível para crianças em idade pré-escolar.
      </div>
    </v-col>
  </v-row>
</template>

<script>
import Logo from "@/assets/images/logo.vue";

export default {
  components: { Logo },
  data: () => ({
    Logo,
  }),
};
</script>

<style></style>
