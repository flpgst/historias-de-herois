<template>
  <v-row>
    <v-col
      cols="12"
      md="6"
      lg="4"
      v-for="({ archetype, brand, codename, description, subtitle, tags }, index) in characters"
      :key="index"
    >
      <character
        :archetype="archetype"
        :brand="brand"
        :codename="codename"
        :description="description"
        :subtitle="subtitle"
        :tags="tags"
      ></character>
    </v-col>
  </v-row>
</template>

<script>
import Character from "@/components/Character.vue";
import charactersDb from "@/db/characters.json";

export default {
  name: "CharacterList",
  components: {
    Character,
  },
  data: () => ({
    characters: charactersDb,
  }),
};
</script>
