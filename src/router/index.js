import Vue from "vue";
import VueRouter from "vue-router";
import goTo from "vuetify/lib/services/goto";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const CharacterRoutes = [
  {
    path: "/batman",
    name: "batman",
    component: () => import(/* webpackChunkName: "batman" */ "../components/CharacterStory.vue"),
  },
  {
    path: "/robin",
    name: "robin",
    component: () => import(/* webpackChunkName: "robin" */ "../components/CharacterStory.vue"),
  },
  {
    path: "/coringa",
    name: "coringa",
    component: () => import(/* webpackChunkName: "coringa" */ "../components/CharacterStory.vue"),
  },
  {
    path: "/capitao-america",
    name: "capitao-america",
    component: () =>
      import(/* webpackChunkName: "capitao-america" */ "../components/CharacterStory.vue"),
  },
  {
    path: "/viuva-negra",
    name: "viuva-negra",
    component: () =>
      import(/* webpackChunkName: "viuva-negra" */ "../components/CharacterStory.vue"),
  },
];

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  ...CharacterRoutes,
];

const router = new VueRouter({
  scrollBehavior: (to, from, savedPosition) => {
    let scrollTo = 0;

    if (to.hash) {
      scrollTo = to.hash;
    } else if (savedPosition) {
      scrollTo = savedPosition.y;
    }

    return goTo(scrollTo, {
      duration: 0,
    });
  },
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
