<template>
  <v-row>
    <v-col cols="12" lg="3" class="d-flex justify-center">
      <logo></logo>
    </v-col>
    <v-col cols="12" lg="6" class="d-flex flex-column align-center justify-center">
      <div
        :class="$vuetify.breakpoint.mdAndDown ? 'text-subtitle-1' : 'text-h5'"
        class="text-center"
      >
        Um lugar com histórias de super-heróis e vilões.
      </div>
      <div
        :class="$vuetify.breakpoint.mdAndDown ? 'text-subtitle-2' : 'text-subtitle-1'"
        class="d-flex text-center"
      >
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
