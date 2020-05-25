<template>
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
  <b-jumbotron fluid="sm">
    <template v-slot:header>New Observation</template>
    <div class="align-items-center">
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <b-form-group id="input-group-1" label="Participant:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.participant" type="text" required placeholder="Enter participant" class="mb-4 mr-sm-4 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Temperature:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.temperature" type="text"  placeholder="Enter temperature" class="mb-2 mr-sm-2 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Weather:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.weather" type="text"  placeholder="Enter  weather" class="mb-2 mr-sm-2 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Wind:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.wind" type="text"  placeholder="Enter wind" class="mb-4 mr-sm-4 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Height:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.height" type="text" placeholder="Enter height" class="mb-2 mr-sm-2 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Girth:" label-for="input-1" >
          <b-form-input id="input-1" v-model="form.girth" type="text" required placeholder="Enter girth" class="mb-4 mr-sm-4 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Leaf Size:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.leaf_size" type="text"  placeholder="Enter leaf_size" class="mb-2 mr-sm-2 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Location:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.location" type="text"  placeholder="Enter location" class="mb-2 mr-sm-2 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Leaf Shape:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.leaf_shape" type="text"  placeholder="Enter Leaf Shape" class="mb-4 mr-sm-4 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Bark Texture:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.bark_texture" type="text" placeholder="Enter Bark Texture" class="mb-2 mr-sm-2 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-1" label="Bark Color:" label-for="input-1">
          <b-form-input id="input-1" v-model="form.bark_color" type="text" placeholder="Enter Bark Color" class="mb-2 mr-sm-2 mb-sm-0  mt-3"></b-form-input>
        </b-form-group>

        <b-button type="submit" variant="primary">Submit</b-button>
        <b-button type="reset" variant="danger">Reset</b-button>
      </b-form>
      <!--<b-card class="mt-3" header="Form Data Result">
        <pre class="m-0">{{ form }}</pre>
      </b-card>-->
    </div>
  </b-jumbotron>
</div>
</template>

<script>
import axios from 'axios';

  export default {
    data() {
      return {
        form: {
          participant:'',
          temperature:'',
          weather:'',
          wind:'',
          height:'',
          girth:'',
          location:'',
          leaf_size:'',
          leaf_shape:'',
          bark_texture:'',
          bark_color:'',
        },
        show: true
      }
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        //alert(JSON.stringify(this.form))
        this.form = JSON.stringify(this.form)
        this.getMessage(this.form)
      },
      onReset(evt) {
        evt.preventDefault()
        // Reset our form values 'girth', 'location',
      this.form.participant='';
       this.form.temperature ='',
       this.form.weather ='',
       this.form.wind = '',
       this.form.height = '',
       this.form.girth ='',
       this.form.location ='',
       this.form.leaf_size = '',
       this.form.leaf_shape = '',
       this.form.bark_texture = '',
        this.form.bark_color = '',

        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      },
      getMessage() {
        //const path = 'http://127.0.0.1:8010/api/observations';
        //console.log(path)
        axios.post('http://127.0.0.1:8010/api/observations',this.form,{ headers: { "Content-Type": "application/x-www-form-urlencoded"}})
          .then((res) => {
            //this.data = res.data;
            console.log(res)
          })
          .catch((error) => {
            // eslint-disable-next-line
            console.error(error);
          });
      },

    }
  }
</script>
