<template>
  <v-row justify="center">
    <v-col cols="12" md="8" lg="6">
      <v-card>
        <v-img :src="require('@/assets/' + imgSrc)"></v-img>
        <v-card-title>{{ codename }}</v-card-title>
        <v-card-subtitle>{{ character.subtitle }}</v-card-subtitle>
        <v-card-text class="text-justify" v-html="character.story"></v-card-text>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import charactersDb from "@/db/characters.json";

export default {
  name: "CharacterStory",
  props: {
    codename: {
      type: String,
      required: true,
    },
  },
  computed: {
    archetypePluralized() {
      return this.character.archetype === "hero" ? "heroes" : "villains";
    },
    imgSrc() {
      return (
        this.character.brand +
        "/" +
        this.archetypePluralized +
        "/" +
        this.character.codename.toLowerCase() +
        "/card-image.jpg"
      );
    },
  },
  data() {
    return {
      character: charactersDb.find((char) => char.codename === this.codename),
    };
  },
};
</script>

<style scoped></style>
