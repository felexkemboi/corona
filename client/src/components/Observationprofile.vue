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
    <h2>Details of one Observation</h2>
    <h3>Bark Colour: {{ data.bark_colour }}</h3>
    <h3>Bark Texture: {{ data.bark_texture }}</h3>
    <h3>Girth: {{ data.girth }}</h3>
    <h3>Leaf Shape: {{ data.leaf_shape }}</h3>
    <h3> ID: {{ data.id }}</h3>
    <h3>Leaf Size: {{ data.leaf_size }}</h3>
    <h3>Location: {{ data.location }}</h3>
    <h3>Participant: {{ data.participant }}</h3>
    <h3>Temperature: {{ data.temperature }}</h3>
    <h3>Timestamp: {{ data.timestamp }}</h3>
    <h3> Weather: {{ data.weather }}</h3>
    <h3>Wind: {{ data.wind }}</h3>
  </div>
</template>
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
      axios.get('http://127.0.0.1:8010/api/observations/4')
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
