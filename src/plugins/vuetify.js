import Vue from "vue";
import Vuetify from "vuetify/lib/framework";

Vue.use(Vuetify);

const customColors = {
  dc: "#0376f2",
  marvel: "ff0000",
  hero: "#ffa726",
  "deep-hero": "#e65100",
  villain: "#8829ff",
  "deep-villain": "#6200e6",
};

export default new Vuetify({
  theme: {
    themes: {
      light: {
        ...customColors,
        background: "#fafafa",
      },
      dark: {
        ...customColors,
      },
    },
  },
});
