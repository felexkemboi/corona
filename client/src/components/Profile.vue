<template>
  <div id='app' class="hello">
    <div>
        <b-navbar centre type="dark" variant="dark" class="align:centre">
          <b-navbar-nav>
            <b-nav-item href="/">Home</b-nav-item>
            <b-nav-item href="http://localhost:8080/users">Users</b-nav-item>
            <b-nav-item href="http://localhost:8080/observations">Observations</b-nav-item>
            <b-nav-item href="http://localhost:8080/newobservation">Submit an observation</b-nav-item>
          </b-navbar-nav>
        </b-navbar>
      </div>
    <img alt="Vue logo" src="http://robohash.org/Bel_Abrahamowitcz">
    <p>
      <!--<a href="https://cli.vuejs.org" target="_blank" rel="noopener">vue-cli documentation</a>.-->
    </p>
    <!--<h3>Installed CLI Plugins</h3>
    <ul>
      <li><a href="https://github.com/vuejs/vue-cli/tree/dev/packages/%40vue/cli-plugin-babel" target="_blank" rel="noopener">babel</a></li>
      <li><a href="https://github.com/vuejs/vue-cli/tree/dev/packages/%40vue/cli-plugin-eslint" target="_blank" rel="noopener">eslint</a></li>
    </ul>-->
    <h3>Name: {{ data.first_name }} {{ data.last_name }}</h3>
    <h3>Email: {{ data.email }}</h3>
    <h3>ID: {{ data.id }}</h3>
    <!--<ul>
      <li><a href="https://vuejs.org" target="_blank" rel="noopener">Core Docs</a></li>
      <li><a href="https://forum.vuejs.org" target="_blank" rel="noopener">Forum</a></li>
      <li><a href="https://chat.vuejs.org" target="_blank" rel="noopener">Community Chat</a></li>
      <li><a href="https://twitter.com/vuejs" target="_blank" rel="noopener">Twitter</a></li>
      <li><a href="https://news.vuejs.org" target="_blank" rel="noopener">News</a></li>
    </ul>-->
  <!--  <h3>Ecosystem</h3>
    <ul>
      <li><a href="https://router.vuejs.org" target="_blank" rel="noopener">vue-router</a></li>
      <li><a href="https://vuex.vuejs.org" target="_blank" rel="noopener">vuex</a></li>
      <li><a href="https://github.com/vuejs/vue-devtools#vue-devtools" target="_blank" rel="noopener">vue-devtools</a></li>
      <li><a href="https://vue-loader.vuejs.org" target="_blank" rel="noopener">vue-loader</a></li>
      <li><a href="https://github.com/vuejs/awesome-vue" target="_blank" rel="noopener">awesome-vue</a></li>
    </ul>-->
  </div>
</template>

<!--<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}
</script> -->
<script>
import axios from 'axios';

export default {
  name: 'Users',
  data() {
    return {
      data: '',
    };
  },
  methods: {
    getMessage() {
      //const path = 'http://127.0.0.1:8010/api/observations';
      //console.log(path)
      axios.get('http://127.0.0.1:8010/api/users/78')
        .then((res) => {
          this.data = res.data;
          console.log(this.data)
        })
        .catch((error) => {
          // eslint-disable-next-line
          console.error(error);
        });
    },
  },
  created() {
    console.log("created")
    this.getMessage();
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
