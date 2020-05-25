<template lang="html">
  <div class="justify-center items-center">
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
    <vs-table stripe :data="data">
      <template slot="header">
        <h3>
          Users
        </h3>
      </template>
      <template slot="thead">
        <vs-th>
          ID
        </vs-th>
        <vs-th>
          Name
        </vs-th>
        <vs-th>
          Email
        </vs-th>
      </template>

      <template slot-scope="{data}">
        <vs-tr :key="item.id" v-for="item in data" >
          <vs-td :data="item.id">
            {{item.id }}
          </vs-td>

          <vs-td :data="item.first_name">
            {{item.first_name }} {{item.last_name }}
          </vs-td>

          <vs-td :data="item.email">
            {{item.email }}
          </vs-td>



        </vs-tr>
      </template>
    </vs-table>
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
      //const path = 'http://127.0.0.1:8010/api/observations';
      //console.log(path)
      axios.get('http://127.0.0.1:8010/api/users')
        .then((res) => {
          this.data = res.data;
          console.log(this.data )
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
