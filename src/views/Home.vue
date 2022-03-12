<template>
  <v-row>
    <v-col cols="12"> </v-col>
    <v-col cols="12">
      <top></top>
      <character-list></character-list>
    </v-col>
  </v-row>
</template>

<script>
import Top from "@/components/Top.vue";
import firebase from "@/plugins/firebase";
import CharacterList from "./CharacterList.vue";

export default {
  name: "Home",
  components: { Top, CharacterList },
  data() {
    return {
      characters: [],
    };
  },
  methods: {
    firebase,
  },
  async mounted() {
    this.characters = await this.firebase();
  },
};
</script>
