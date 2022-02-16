import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/batman",
    name: "batman",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "batman" */ "../views/dc/heroes/Batman.vue"),
  },
  {
    path: "/coringa",
    name: "coringa",
    // component: () => import(/* webpackChunkName: "coringa" */ "../views/dc/heroes/Coringa.vue"),
  },
  {
    path: "/robin",
    name: "robin",
    // component: () => import(/* webpackChunkName: "robin" */ "../views/dc/heroes/Robin.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
