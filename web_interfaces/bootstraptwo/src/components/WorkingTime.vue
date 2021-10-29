<template>
  <div>
    test
    <button v-on:click="createWorkingTime(this.workingtime)">
      createWorkingTime
    </button>
    <button
      v-on:click="
        updateWorkingTime(
          this.id,
          this.userID,
          this.workingtime.start,
          this.workingtime.end
        )
      "
    >
      updateWorkingTime
    </button>
    <button v-on:click="deleteWorkingTime(this.id)">
      deleteWorkingTime
    </button>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function () {
    return {
      path: "http://localhost:4000/api/workingtimes",
      workingtime: { user_id: 5, start: "2021-10-29 08:00:00", end: "2021-10-29 18:30:00" },
      userID: 5,
      id: 3
    };
  },
  methods: {
    createWorkingTime: function (WorkingTime) {
      axios
        .post(this.path, {
            workingtime: WorkingTime
        })
        .then((response) => {
          console.log(response.data);
        });
    },
    updateWorkingTime: function (Id, UserID, Start, End) {
      axios
        .put(this.path + "/" + Id, {
          workingtime: {
            user_id: UserID,
            start: Start,
            end: End
          },
        })
        .then((response) => {
          console.log(response.data);
        });
    },
    deleteWorkingTime: function (Id, UserID) {
      axios
        .delete(this.path + "/" + Id)
        .then((response) => {
          console.log(response);
        });
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
