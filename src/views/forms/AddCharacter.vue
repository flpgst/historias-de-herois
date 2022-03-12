<template>
  <v-card>
    <v-form>
      <v-card-title>Adicionar novo personagem</v-card-title>
      <v-card-subtitle>Digite os dados para submeter uma nova história</v-card-subtitle>
      <v-card-text>
        <v-text-field
          v-model="codename"
          label="Codenome"
          :rules="[(v) => !!v || 'Campo obrigatório']"
        ></v-text-field>
      </v-card-text>
      <v-card-text>
        <v-text-field
          v-model="subtitle"
          label="Subtítulo"
          :rules="[(v) => !!v || 'Campo obrigatório']"
        ></v-text-field>
      </v-card-text>
      <v-card-text>
        <v-select
          v-model="archetype"
          :items="archetypes"
          label="Arquetipo"
          :rules="[(v) => !!v || 'Campo obrigatório']"
        ></v-select>
      </v-card-text>
      <v-card-text>
        <v-select
          v-model="brand"
          :items="brands"
          label="Editora"
          :rules="[(v) => !!v || 'Campo obrigatório']"
        ></v-select>
      </v-card-text>
      <v-card-text>
        <v-textarea
          v-model="description"
          label="Breve Descrição"
          :rules="[(v) => !!v || 'Campo obrigatório']"
        ></v-textarea>
      </v-card-text>
      <v-card-text>
        <v-textarea
          v-model="story"
          label="História"
          :rules="[(v) => !!v || 'Campo obrigatório']"
        ></v-textarea>
      </v-card-text>
      <v-card-actions class="d-flex justify-end">
        <v-btn
          color="primary"
          :class="
            $vuetify.theme.dark ? 'orange--text text--lighten-2' : 'purple--text text--lighten-1'
          "
        >
          Enviar
          <v-icon right>mdi-send</v-icon>
        </v-btn>
      </v-card-actions>
    </v-form>
  </v-card>
</template>

<script>
export default {};
</script>

<style></style>
