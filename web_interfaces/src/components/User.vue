<template>
  <div>
    <button v-on:click="getUser()">getUser</button>
    <button v-on:click="createUser(this.user)">createUser</button>
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
      path: 'http://localhost:4000/api/users',
      user: { email: 'test@gmail.com', username: 'test' },
      userId: 3
    }
  },
  methods: {
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
</style>
