<template>
  <div>
    <button v-on:click="getWorkingTimes(this.userId)">getWorkingTimes</button>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: "WorkingTimes",
  data() {
    return {
      path: "http://localhost:4000/api/workingtimes",
      userId: 1,
      startDate: '2021-10-26 22:33:08',
      endDate: '2021-10-26 22:33:08',
      workingTimes: {}
    };
  },
  methods: {
    getWorkingTimes (userId) {
      axios
      .get(this.path + '/' + userId + '?' + 'start=' + this.startDate + '&end=' + this.endDate)
      .then((response) => {
        console.log(response.data)
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
