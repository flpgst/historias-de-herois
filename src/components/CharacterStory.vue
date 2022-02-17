<template>
  <v-row justify="center">
    <v-col cols="12" md="8" lg="6">
      <v-card>
        <v-img height="600" :src="require('@/assets/' + imgSrc)"></v-img>
        <v-card-title>{{ character.codename }}</v-card-title>
        <v-card-subtitle>{{ character.subtitle }}</v-card-subtitle>
        <v-card-text class="text-justify" v-html="character.story"></v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import charactersDb from "@/db/characters.json";
import normalizarNome from "@/helpers/normalizarNome";

export default {
  name: "CharacterStory",
  computed: {
    archetypePluralized() {
      return this.character.archetype === "hero" ? "heroes" : "villains";
    },
    imgSrc() {
      const img =
        this.character.brand +
        "/" +
        this.archetypePluralized +
        "/" +
        normalizarNome(this.character.codename) +
        "/card-image.jpg";

      return img;
    },
  },
  data() {
    return {
      character: charactersDb.find((char) => char.codename === this.$route.params.codename),
    };
  },
};
</script>

<style scoped></style>
