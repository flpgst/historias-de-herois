<template>
  <v-row justify="center">
    <v-col cols="12" md="8" lg="6">
      <v-card>
        <v-img
          :height="$vuetify.breakpoint.mdAndDown ? 300 : 600"
          :src="require('@/assets/' + imgSrc)"
        ></v-img>
        <div :class="`${character.archetype} text-shadow-${character.archetype} white--text`">
          <v-card-title>{{ character.codename }}</v-card-title>
          <v-card-subtitle>{{ character.subtitle }}</v-card-subtitle>
        </div>
        <v-card-text class="text-justify" v-html="character.story"></v-card-text>
        <v-card-actions :class="`${character.archetype} py-0`">
          <character-tags
            :archetype="character.archetype"
            :brand="character.brand"
            :tags="character.tags"
            :class="` align-center`"
          ></character-tags>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import charactersDb from "@/db/characters.json";
import normalizarNome from "@/helpers/normalizarNome";
import CharacterTags from "@/components/CharacterTags.vue";

export default {
  name: "CharacterStory",
  components: {
    CharacterTags,
  },
  computed: {
    archetypePluralized() {
      return this.character.archetype === "hero" ? "heroes" : "villains";
    },
    imgSrc() {
      console.log("this.character :>> ", this.character);
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
      character: charactersDb.find((char) => {
        return normalizarNome(char.codename) === this.$route.name.toLowerCase();
      }),
    };
  },
};
</script>

<style scoped></style>
