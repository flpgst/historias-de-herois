<template>
  <v-row>
    <v-col cols="12">
      <top></top>
    </v-col>
    <v-col cols="12">
      <character-list></character-list>
    </v-col>
  </v-row>
</template>

<script>
import Top from "@/components/Top.vue";
import CharacterList from "./CharacterList.vue";

export default {
  name: "Home",

  components: { Top, CharacterList },
};
</script>
