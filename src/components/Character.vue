<template>
  <v-row class="d-flex justify-center">
    <v-col cols="12" md="10">
      <v-card class="card" hover :to="{ name: codename.toLowerCase() }">
        <div class="d-flex">
          <v-parallax
            class="flex-grow-1 rounded mb-1"
            height="350"
            :src="require('@/assets/' + imgSrc)"
          >
          </v-parallax>
          <div v-if="$vuetify.breakpoint.mdAndUp" class="d-flex mb-1">
            <character-tags
              :archetype="archetype"
              :brand="brand"
              :tags="tags"
              :class="` ${archetype}-gradient d-flex flex-column rounded ml-1`"
            ></character-tags>
          </div>
        </div>
        <div :class="`${archetype} rounded text-shadow-${archetype} white--text`">
          <v-card-title class="pa-1">{{ codename }}</v-card-title>
          <v-card-subtitle class="pa-1 d-flex d-inline-block justify-space-between">
            <div>{{ subtitle }}</div>
          </v-card-subtitle>
        </div>

        <v-card-text>
          {{ description }}
        </v-card-text>
        <v-card-actions v-if="$vuetify.breakpoint.smAndDown" :class="`${archetype}`">
          <character-tags
            :archetype="archetype"
            :brand="brand"
            :tags="tags"
            :class="`d-flex flex-grow-1 mx-auto align-center`"
          ></character-tags>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import CharacterTags from "@/components/CharacterTags.vue";

export default {
  name: "Character",
  components: {
    CharacterTags,
  },
  props: {
    archetype: {
      type: String,
      required: true,
      validator: (value) => ["hero", "villain"].indexOf(value) !== -1,
    },
    brand: {
      type: String,
      required: true,
      validator: (value) => ["dc", "marvel"].indexOf(value) !== -1,
    },
    codename: {
      type: String,
      required: true,
    },
    subtitle: {
      type: String,
      required: true,
    },
    description: {
      type: String,
      required: true,
    },
    /**
     * Tags que serão renderizados ao lado da imagem do personagem
     * @param {Object[]} tags - Objeto contendo o header e a propriedade a ser renderizada.
     * @param {string} tags[].label - Texto que será mostrado
     * @param {string} tags[].tooltip - Tooltip da tag
     * @example :tags="[{label: 'Gotham', tooltip: 'Localização'}, {label: 'Batmovel', tooltip: 'Veículo'}]"
     */
    tags: {
      type: Array,
      default: () => [],
    },
  },
  computed: {
    archetypePluralized() {
      return this.archetype === "hero" ? "heroes" : "villains";
    },
    imgSrc() {
      return (
        this.brand +
        "/" +
        this.archetypePluralized +
        "/" +
        this.codename.toLowerCase() +
        "/card-image.jpg"
      );
    },
  },
  // data: () => ({
  //   imgPath: "",
  // }),
  mounted() {
    // this.getImgPath();
  },
  methods: {
    getImgPath() {
      // const archetypeFolder = this.archetype === "hero" ? "heroes" : "villains";
      // const path = "@/assets/" + this.brand + "/" + archetypeFolder + "/" + this.image;

      this.imgPath = "@/assets/dc/heroes/batman/card-image.jpg";
    },
  },
};
</script>

<style scoped lang="scss">
@import "~vuetify/src/styles/main.sass";

.card {
  border: 5px solid transparent;
}
.text-shadow {
  &-hero {
    text-shadow: 1px 1px map-get($deep-orange, "darken-4");
  }
  &-villain {
    text-shadow: 1px 1px map-get($deep-purple, "darken-4");
  }
}
.hero-gradient {
  background: #e65100;
  background: linear-gradient(45deg, #e65100 0%, #ffa726 100%);
}
.villain-gradient {
  background: #8829ff;
  background: linear-gradient(45deg, #8829ff 0%, #6200e6 100%);
}
</style>
