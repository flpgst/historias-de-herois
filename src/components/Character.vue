<template>
  <v-row class="d-flex justify-center">
    <v-col cols="12" md="10">
      <v-card
        :disabled="!story"
        ref="characterCard"
        class="card"
        hover
        :to="{ name: normalizarNome(codename), params: { codename } }"
      >
        <div class="d-flex">
          <v-img class="rounded mb-1" height="350" width="200" :src="require('@/assets/' + imgSrc)">
          </v-img>
          <div v-if="$vuetify.breakpoint.lgAndUp" class="d-flex mb-1">
            <character-tags
              :archetype="archetype"
              :brand="brand"
              :tags="tags"
              :class="` ${archetype}-gradient d-flex flex-column rounded ml-1`"
            ></character-tags>
          </div>
        </div>
        <div :class="`d-flex align-center justify-space-between ${archetype} rounded `">
          <div :class="`text-shadow-${archetype} white--text`">
            <v-card-title class="pa-1">{{ codename }}</v-card-title>
            <v-card-subtitle class="pa-1 d-flex d-inline-block justify-space-between">
              <div>{{ subtitle }}</div>
            </v-card-subtitle>
          </div>

          <v-chip v-if="!story" disabled class="mx-1">
            <v-icon>mdi-mod-bad</v-icon>
            Sem história cadastrada
          </v-chip>
        </div>

        <v-card-text>
          <v-row>
            <v-col cols="12" class="text-justify">
              <span>{{ description }}</span>
            </v-col>
          </v-row>
        </v-card-text>
        <v-card-actions v-if="$vuetify.breakpoint.mdAndDown" :class="`${archetype} rounded py-0`">
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
import normalizarNome from "@/helpers/normalizarNome";

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
      validator: (value) => ["dc", "marvel", ""].indexOf(value) !== -1,
    },
    codename: {
      type: String,
      required: true,
    },
    subtitle: {
      type: String,
      default: "",
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
    story: {
      type: Boolean,
      required: false,
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
        normalizarNome(this.codename) +
        "/card-image.jpg"
      );
    },
  },
  methods: {
    normalizarNome,
  },
};
</script>

<style scoped lang="scss">
.card {
  border: 5px solid transparent;
}
</style>
