import Vue from 'vue';
import Router from 'vue-router';
import Observations from './components/Observations.vue';
import Users from './components/Users.vue';
import NewObservation from './components/NewObservation.vue';
import Profile from './components/Profile.vue';
import Observationprofile from './components/Observationprofile.vue';
import Home from './components/Home.vue';





Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/observations',
      name: 'observations',
      component: Observations,
    },
    {
      path: '/users',
      name: 'users',
      component: Users,
    },
    {
      path: '/newobservation',
      name: 'newobservation',
      component: NewObservation,
    },
    {
      path: '/userprofile/:id',
      name: 'profile',
      component: Profile,
    },
    {
      path: '/observation/:id',
      name: 'observationprofile',
      component: Observationprofile,
    }

  ],
});
