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
            <v-btn small v-on:click="getUser(user.id)">Show</v-btn>

            <v-dialog v-model="editUserDialog" persistent max-width="600px">
              <template v-slot:activator="{ on, attrs }">
                <v-btn small color="green" dark v-bind="attrs" v-on="on">Edit</v-btn>
              </template>
              <v-card>
                <v-card-title justify="center">
                  <span class="text-h5">Edit user</span>
                </v-card-title>
                <v-card-text>
                  <v-container>
                    <v-form>
                      <v-container>
                        <v-row justify="center" >
                          <v-col cols="1" sm="5" md="5">
                            <v-text-field v-model="newUsername" outlined required label="Username"></v-text-field>
                            <v-text-field v-model="newEmail" outlined required label="Email"></v-text-field>
                          </v-col>
                        </v-row>
                      </v-container>
                    </v-form>
                  </v-container>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text v-on:click="editUserDialog = false">Close</v-btn>
                  <v-btn color="green" dark v-on:click="updateUser(user.id)">Edit</v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
            <v-btn small v-on:click="deleteUser(user.id)" color="error">Delete</v-btn>
          </tr>
      </tbody>
    </v-simple-table>
    <v-dialog v-model="createUserDialog" persistent max-width="600px">
      <template v-slot:activator="{ on, attrs }">
        <v-btn color="primary" dark v-bind="attrs" v-on="on">New user</v-btn>
      </template>
      <v-card>
        <v-card-title justify="center">
          <span class="text-h5">New user</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-form>
              <v-container>
                <v-row justify="center" >
                  <v-col cols="1" sm="5" md="5">
                    <v-text-field v-model="newUsername" outlined required label="Username"></v-text-field>
                    <v-text-field v-model="newEmail" outlined required label="Email"></v-text-field>
                  </v-col>
                </v-row>
              </v-container>
            </v-form>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text v-on:click="createUserDialog = false">Close</v-btn>
          <v-btn color="primary" v-on:click="createUser()">Save</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'User',
  data () {
    return {
      users: [],
      createUserDialog: false,
      editUserDialog: false,
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
    getUsersByEmailAndUsername () {
      axios
        .get(this.path + '?email=' + this.user.email + '&username=' + this.user.username)
        .then((response) => {
          this.users = response.data.data
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
    updateUser (id) {
      axios
        .put(this.path + '/' + id, {
          user: {
            username: this.newUsername,
            email: this.newEmail
          }
        })
        .then((response) => {
          console.log(response.data)
          location.reload()
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
