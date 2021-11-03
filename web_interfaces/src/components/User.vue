<template>
  <div>
    <v-container justify="center">
      <h2>Utilisateur : {{this.user.username}}</h2>
    </v-container>
    <v-btn small>
      <router-link :to="'/clock/' + this.user.id">Clock</router-link>
    </v-btn>
    <workingtimes/>
  </div>
</template>

<script>
import axios from 'axios'
import Workingtimes from './WorkingTimes.vue'

export default {
  name: 'User',
  components: { Workingtimes },
  data () {
    return {
      path: 'http://localhost:4000/api/users',
      user: []
    }
  },
  mounted (){
    this.getUser(this.$route.params.id)
  },
  methods: {
    getUser (id){
      axios
        .get(this.path + '/' + id)
        .then((response) => {
          this.user = response.data.data
          console.log(response.data.data)
        })
    },
  }
}
</script>

<style>
</style>