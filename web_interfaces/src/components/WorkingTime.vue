<template>
  <div>
    <v-form>
      <v-container>
        <v-row>
          <v-col cols="3" sm="6" md="3">
            <input type="datetime-local" v-model="dateStart" placeholder="Date de début">
            <input type="datetime-local" v-model="dateEnd" placeholder="Date de fin">
            <v-btn v-on:click="createWorkingTime(this.userID, this.dateStart, this.dateEnd)" color="accent" elevation="2">Créer</v-btn>
            <v-btn v-on:click="updateWorkingTime(this.id, this.userID, this.dateStart, this.dateEnd)" color="accent" elevation="2">Modifier</v-btn>
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
      dateStart: '2021-10-29 08:00:00',
      dateEnd: '2021-10-29 18:30:00',
      userId: 1, // current_user in future
      id: 3 //id test
    }
  },
  methods: {
    createWorkingTime (userId, dateStart, dateEnd) {
      axios
        .post(this.path + '/' + userId, {
          workingtime: {
            start: dateStart,
            end: dateEnd
          }
        })
        .then((response) => {
          console.log(response.data)
          location.reload()
        })
        .catch(err => console.log(err.message))
    },
    updateWorkingTime (id, UserID, dateStart, dateEnd) {
      axios
        .put(this.path + "/" + id, {
          workingtime: {
            user_id: UserID,
            start: dateStart,
            end: dateEnd
          },
        })
        .then((response) => {
          console.log(response.data)
          location.reload()
        })
        .catch(err => console.log(err.message))
    },
    deleteWorkingTime (id) {
      axios
        .delete(this.path + "/" + id)
        .then((response) => {
          console.log(response);
          location.reload()
        })
        .catch(err => console.log(err.message))
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