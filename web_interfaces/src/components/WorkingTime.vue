<template>
  <div>
    <v-form>
      <v-container>
        <v-row>
          <v-col cols="3" sm="6" md="3">
            <input type="datetime-local" v-model="dateStart" placeholder="Date de début">
            <input type="datetime-local" v-model="dateEnd" placeholder="Date de fin">
            <v-btn v-on:click="createWorkingTime(1)" color="accent" elevation="2">Créer</v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
    <div class="create-workingTime">
    </div>
    <button v-on:click="deleteWorkingTime(this.id)">Delete Working Time</button>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'WorkingTime',
  data () {
    return {
      path: 'http://localhost:4000/api/workingtimes',
      dateStart: '',
      dateEnd: '',
      userId: 1 // current_user in future
    }
  },
  methods: {
    createWorkingTime (userId) {
      axios
        .post(this.path + '/' + userId, {
          workingtime: {
            start: this.dateStart,
            end: this.dateEnd
          }
        })
        .then((response) => {
          console.log(response.data)
          location.reload()
        })
        .catch(err => console.log(err.message))
    },
    updateWorkingTime () {
    },
    deleteWorkingTime (id) {
    }
  }
}
</script>

<style scoped>
  div #select {
    color: #6a66d8;
    font-size: 40px;
  }
</style>