<template>
  <v-row>
    <v-col cols="3" class="d-flex justify-center">
      <logo></logo>
    </v-col>
    <v-col cols="6" class="d-flex align-center text-justify">
      <span class="text-h5">
        Aqui contamos as histórias dos super-heróis com uma linguagem limpa e acessível para
        crianças em idade pré-escolar.
      </span>
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
