<template>
  <div>
    <v-form>
      <v-container>
        <v-row>
          <v-col cols="3" sm="6" md="3">
            <v-btn v-on:click="getClock(userID)" color="accent" elevation="2"
              >get</v-btn
            >
            <v-btn
              v-on:click="manageClock(userID, startDateTime, true)"
              color="accent"
              elevation="2"
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
import moment from "moment";
import WorkingTime from "./WorkingTime.vue";

//moment(this.clock.time, "“YYYY-MM-DD hh:mm:ss").fromNow();

export default {
  name: "Clock",
  data() {
    return {
      path: "http://localhost:4000/api/clocks",
      startDateTime: this.getDate(),
      userID: 6, // current_user in future
      clock: null,
    };
  },
  methods: {
    async getClock(UserID) {
      const response = await axios
        .get(this.path + "/" + UserID)
        .catch((error) => console.log(error));
      this.clock = response.data.data;
      console.log(this.startDateTime);
    },
    createClock(UserID, startTime, Status) {
      axios
        .post(this.path + "/" + UserID, {
          clock: {
            time: startTime,
            status: Status,
            user_id: UserID,
          },
        })
        .then((response) => {
          console.log(response.data);
        })
        .catch((err) => console.log(err.message));
    },
    updateClock(UserID, Status) {
      axios
        .put(this.path + "/" + UserID, {
          clock: {
            status: Status,
          },
        })
        .then((response) => {
          console.log(response.data);
        })
        .catch((err) => console.log(err.message));
    },
    async manageClock(UserID, startTime, Status) {
      await this.getClock(UserID);
      if (this.clock == null) {
        this.createClock(UserID, startTime, Status);
      } else {
        this.updateClock(UserID, !this.clock.status);
        if (!this.clock.status == false) {
          this.WorkingTime.createWorkingTime(
            UserID,
            this.clock.time,
            this.getDate()
          );
        }
        //working time creation
      }
    },
    getDate() {
      var date = new Date().toISOString();
      date = date.replace("T", " ");
      date = date.replace("Z", "");
      date = date.replace(/\.[0-9]{0,10}/, "");
      return date;
    },
  },
};
</script>

<style scoped>
div #select {
  color: #6a66d8;
  font-size: 40px;
}
</style>
