<template>
  <div>
    <p>{{ msg }}</p>
  </div>
</template>

<script>
import axios from 'axios';
axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*';
axios.defaults.headers.post['Access-Control-Allow-Credentials'] = true;
axios.defaults.headers.post['Access-Control-Allow-Headers'] = 'Origin', 'Content-Type', 'Accept';
axios.defaults.headers.post['Access-Control-Allow-Methods'] = 'GET,PUT,POST,DELETE';



export default {
  name: 'Observations',
  data() {
    return {
      msg: '',
    };
  },
  methods: {
    getMessage() {
      //const path = 'http://127.0.0.1:8010/api/observations';
      //console.log(path)
      axios.get('http://127.0.0.1:8010/api/observations',headers:{'GET '})
        .then((res) => {
          this.msg = res;
          console.log(this.msg )
        })
        .catch((error) => {
          // eslint-disable-next-line
          console.error(error);
        });
    },
  },
  created() {
    this.getMessage();
  },
};
</script>
