import Vue from 'vue';
import Router from 'vue-router';
import Observations from './components/Observations.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/observations',
      name: 'observations',
      component: Observations,
    }
  ],
});
