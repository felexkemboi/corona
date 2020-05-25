<template lang="html">
  <div>
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
          Observations
        </h3>
      </template>
      <template slot="thead">
        <vs-th>
          ID
        </vs-th>
        <vs-th>
          Bark Texture
        </vs-th>
        <vs-th>
          Girth
        </vs-th>
        <vs-th>
          Height
        </vs-th>
        <vs-th>
          Bark color
        </vs-th>
        <vs-th>
          Leaf size
        </vs-th>
        <vs-th>
          Location
        </vs-th>
        <vs-th>
          Participant
        </vs-th>
        <vs-th>
          Temperature
        </vs-th>
        <vs-th>
          Weather
        </vs-th>
        <vs-th>
          Timestamp
        </vs-th>
        <vs-th>
          Weather
        </vs-th>
        <vs-th>
          Wind
        </vs-th>
      </template>

      <template slot-scope="{data}">
        <vs-tr :key="item.id" v-for="item in data" >
          <vs-td :data="item.id">
            {{item.id}}
          </vs-td>

          <vs-td :data="item.bark_texture">
            {{item.bark_texture}}
          </vs-td>

          <vs-td :data="item.girth">
            {{item.girth}}
          </vs-td>

          <vs-td :data="item.height">
            {{item.height}}
          </vs-td>

          <vs-td :data="item.bark_colour">
            {{item.bark_colour}}
          </vs-td>

          <vs-td :data="item.leaf_shape">
            {{item.leaf_shape}}
          </vs-td>

          <vs-td :data="item.leaf_size">
            {{item.leaf_size}}
          </vs-td>

          <vs-td :data="item.location">
            {{item.location}}
          </vs-td>

          <vs-td :data="item.participant">
            {{item.participant}}
          </vs-td>

          <vs-td :data="item.temperature">
            {{item.temperature}}
          </vs-td>

          <vs-td :data="item.timestamp">
            {{item.timestamp}}
          </vs-td>

          <vs-td :data="item.weather">
            {{item.weather}}
          </vs-td>

          <vs-td :data="item.wind">
            {{item.wind}}
          </vs-td>


        </vs-tr>
      </template>
    </vs-table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Observations',
  data() {
    return {
      data: '',
    };
  },
  methods: {
    getMessage() {
      //const path = 'http://127.0.0.1:8010/api/observations';
      //console.log(path)
      axios.get('http://127.0.0.1:8010/api/observations')
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
