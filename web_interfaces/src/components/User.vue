<template>
  <div>
    <div class="panel-heading">List of users</div>
    <div class="panel-body">
        <table class="table">
            <thead>
              <tr>
                <th>Username</th>
                <th>Email</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="user in users" :key="user.id">
                <td>{{user.username}}</td>
                <td>{{user.email}}</td>
                <button v-on:click="getUser()">getUser</button>
              </tr>
          </tbody>
        </table>
    </div>
    <div class="create-user">
      <input type="text" v-model="this.user.username" placeholder="Username">
      <input type="text" v-model="this.user.email" placeholder="Email">
      <button v-on:click="createUser(this.user)">createUser</button>
    </div>
    <button v-on:click="getUser(this.userId)">getUserById</button>
    <button v-on:click="getUser()">getUser</button>
    <button v-on:click="updateUser(this.userId, this.user.email, this.user.username)"></button>
    <button v-on:click="deleteUser(this.userId)">deleteUser</button>
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
    createUser (User) {
      axios
        .post(this.path, {
          data: {
            user: User
          }
        })
        .then((response) => {
          console.log(response.data)
        })
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
    deleteUser (userId) {
      axios
        .delete(this.path + '/' + this.userId, {
          headers: {
            'Content-Type': 'application/json'
          }
        })
        .then((response) => {
          console.log(response)
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
