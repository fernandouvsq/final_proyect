<template>
  <div>
    <v-form>
      <v-container>
        <v-row>
          <v-col cols="3" sm="6" md="3">
            <v-btn
              v-on:click="getClock(userID)"
              color="accent"
              elevation="2"
              >get</v-btn
            >
            <v-btn v-on:click="updateClock(userID)" color="accent" elevation="2"
              >update</v-btn
            >
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Clock",
  data() {
    return {
      path: "http://localhost:4000/api/clocks",
      startDateTime: "2021-10-29 08:00:00",
      clockIn: true,
      userID: 4 // current_user in future
    };
  },
  methods: {
    getClock(UserID) {
      axios
        .get(this.path + "/" + UserID)
        .then((response) => {
          console.log(response.data.data);
        })
        .catch((err) => console.log(err.message))
    },
    updateClock(UserID) {
      axios
        .post(this.path + "/" + UserID, {
          clock: {
            time: startDateTime,
            status: clockIn,
            user_id: UserID
          },
        })
        .then((response) => {
          console.log(response.data);
          location.reload();
        })
        .catch((err) => console.log(err.message))
    }
  }
};
</script>

<style scoped>
div #select {
  color: #6a66d8;
  font-size: 40px;
}
</style>
