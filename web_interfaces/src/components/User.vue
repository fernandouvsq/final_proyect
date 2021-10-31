<template>
  <div>
    <v-simple-table>
        <thead>
          <tr>
            <th class="text-left">Username</th>
            <th class="text-left">Email</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in users" :key="user.id">
            <td>{{user.username}}</td>
            <td>{{user.email}}</td>
            <v-btn v-on:click="getUser(user.id)">Voir</v-btn>
            <v-btn v-on:click="deleteUser(user.id)" color="error">Delete</v-btn>
          </tr>
      </tbody>
    </v-simple-table>
    <v-form>
      <v-container>
        <v-row>
          <v-col cols="3" sm="6" md="3">
            <v-text-field v-model="newUsername" dense label="Username"></v-text-field>
            <v-text-field v-model="newEmail" dense label="Email"></v-text-field>
            <v-btn v-on:click="createUser()" color="accent" elevation="2">Create user</v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
    <button v-on:click="getUser()">getUser</button>
    <button v-on:click="updateUser(this.userId, this.user.email, this.user.username)">updateUser</button>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'User',
  data () {
    return {
      users: [],
      path: 'http://localhost:4000/api/users',
      user: { email: 'test@gmail.com', username: 'test' },
      newUsername: '',
      newEmail: '',
      userId: 3 //current_user in future
    }
  },
  mounted (){
    this.getAllUsers()
  },
  methods: {
    getAllUsers (){
      axios
        .get(this.path + '/all')
        .then((response) => {
          this.users = response.data.data
        })
        .catch(err => console.log(err.message))
    },
    getUserById (){
      axios
        .get(this.path + '/' + this.userId)
        .then((response) => {
          console.log(response.data)
        })
    },
    getUser () {
      axios
        .get(
          this.path +
            '?email=' +
            this.user.email +
            '&username=' +
            this.user.username
        )
        .then((response) => {
          console.log(response.data)
        })
    },
    createUser () {
      axios
        .post(this.path, {
          user: {
            username: this.newUsername,
            email: this.newEmail
          }
        })
        .then((response) => {
          console.log(response.data)
          location.reload()
        })
        .catch(err => console.log(err.message))
    },
    updateUser (userId, Email, Username) {
      axios
        .put(this.path + '/' + userId, {
          headers: {
            'Content-Type': 'application/json'
          },
          data: {
            email: Email,
            username: Username
          }
        })
        .then((response) => {
          console.log(response.data)
        })
    },
    deleteUser (id) {
      axios
        .delete(this.path + '/' + id)
        .then((response) => {
          console.log(response)
          this.getAllUsers()
        })
    }
  }
}
</script>

<style scoped>
  div #select {
    color: #6a66d8;
    font-size: 40px;
  }

  .create-user{
    width:10%;
    display: flex;
    flex-direction: column;
  }

  .create-user input{
    height:25px;
  }
</style>
