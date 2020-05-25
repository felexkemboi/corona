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
    <img alt="Vue logo" src="https://robohash.org/UPU.png?set=set1">
    <p>
    </p>
    <h3><a href="http://localhost:8080/observations">List of Observations</a></h3>
    <h3><a href="http://localhost:8080/observations">List of Users</a></h3>
    <h3><a href='http://127.0.0.1:8010/api/users/78'>One User</a></h3>
    <h3><a href="http://localhost:8080/observation/4">One Observation</a></h3>
  </div>
</template>

<script>

export default {
  name: 'Users',
  created() {
    console.log("created")
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
