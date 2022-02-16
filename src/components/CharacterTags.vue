<template>
  <div>
    <v-tooltip
      :right="$vuetify.breakpoint.mdAndUp"
      :top="$vuetify.breakpoint.smAndDown"
      :color="archetype === 'hero' ? 'hero-tag' : 'villain-tag'"
    >
      <template v-slot:activator="{ on, attrs }">
        <img
          v-if="$vuetify.breakpoint.mdAndUp"
          v-bind="attrs"
          v-on="on"
          :src="require(`@/assets/${brand === 'dc' ? 'dc' : 'marvel'}/logo.svg`)"
          :height="50"
          class="my-3"
        />
        <v-chip
          v-else
          v-bind="attrs"
          v-on="on"
          label
          dark
          :color="brand === 'dc' ? 'dc' : 'marvel'"
          :class="`${$vuetify.breakpoint.smAndDown ? 'px-4' : 'px-0'} ma-1 justify-center`"
        >
          <img
            v-bind="attrs"
            v-on="on"
            :src="require(`@/assets/${brand === 'dc' ? 'dc' : 'marvel'}/logo.svg`)"
            :height="30"
            class="my-3"
          />
        </v-chip>
      </template>
      Editora
      {{ brand === "dc" ? "DC Comics" : "Marvel Comics" }}
    </v-tooltip>
    <v-tooltip
      :right="$vuetify.breakpoint.mdAndUp"
      :top="$vuetify.breakpoint.smAndDown"
      :color="archetype === 'hero' ? 'hero-tag' : 'villain-tag'"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-chip
          v-bind="attrs"
          v-on="on"
          label
          dark
          :color="archetype === 'hero' ? 'orange darken-4' : 'purple darken-4'"
          :class="`${$vuetify.breakpoint.smAndDown ? 'px-4' : 'px-0'} ma-1 justify-center`"
        >
          <span>{{ archetypeTranslated }}</span>
        </v-chip>
      </template>
      <span>Arquétipo</span>
    </v-tooltip>

    <v-tooltip
      v-for="({ label, tooltip }, index) in tags"
      :key="index"
      :right="$vuetify.breakpoint.mdAndUp"
      :top="$vuetify.breakpoint.smAndDown"
      :color="archetype === 'hero' ? 'hero-tag' : 'villain-tag'"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-chip
          v-bind="attrs"
          v-on="on"
          label
          dark
          :color="archetype === 'hero' ? 'orange darken-4' : 'purple darken-4'"
          :class="`${$vuetify.breakpoint.smAndDown ? 'px-4' : 'px-0'} ma-1 justify-center`"
        >
          <span>{{ label }}</span>
        </v-chip>
      </template>
      <span>{{ tooltip }}</span>
    </v-tooltip>
  </div>
</template>

<script>
export default {
  name: "CharacterTags",
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
    tags: {
      type: Array,
      default: () => [],
    },
  },
  computed: {
    archetypeTranslated() {
      return this.archetype === "hero" ? "Herói" : "Vilão";
    },
  },
};
</script>
<style scoped>
.hero-tag {
  background: rgba(230, 81, 0, 0.8);
}
.villain-tag {
  background: rgba(137, 41, 255, 0.8);
}
</style>
