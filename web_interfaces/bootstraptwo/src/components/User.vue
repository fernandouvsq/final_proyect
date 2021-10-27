<template>
  <div>test</div>
</template>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
        path: "http://localhost:4000/api/user",
        user: { email: "test@gmail.com", username: "test" }
    };
  },
  methods: {
    getUser: function () {
      axios.get(this.path + "?email=" + this.user.email + "&username=" + this.user.username);
    },
    createUser: function (email, username) {
        axios.post(this.path, this.user);
    },
    updateUser: function (email, username) {},
    deleteUser: function (email, username) {},
  },
};
</script>

<style scoped>
div #select {
  color: #6a66d8;
  font-size: 40px;
}
</style>
