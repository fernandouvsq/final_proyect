<template>
  <div>
    <v-container>
      <h2 class="text-center">Workingtimes</h2>
      <v-row justify="center">
        <v-card :elevation="6" class="ma-4 pa-6" v-for="workingtime in workingtimes" :key="workingtime.id">
          <p>Start : {{format_date(workingtime.start)}}</p>
          <p>End : {{format_date(workingtime.end)}}</p>
        </v-card>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import axios from 'axios'
import moment from 'moment'

export default {
  name: "WorkingTimes",
  data() {
    return {
      workingtimes: [],
      path: "http://localhost:4000/api/workingtimes",
      userId: 1,
      startDate: '',
      endDate: '',
    };
  },
  mounted (){
    this.getWorkingTimes (this.$route.params.user_id)
  },
  methods: {
    getWorkingTimes (user_id) {
      axios
        .get(this.path + '/' + user_id)
        .then((response) => {
          console.log(response.data.data)
          this.workingtimes = response.data.data
        })
        .catch(err => console.log(err.message))
    },
    getWorkingTimesByDates (userId) {
      axios
      .get(this.path + '/' + userId + '?' + 'start=' + this.startDate + '&end=' + this.endDate)
      .then((response) => {
        console.log(response.data)
      })
    },
    format_date (value){
      if (value) {
        return moment(String(value)).format('MM/DD/YYYY hh:mm')
      }
    },
  }
}

</script>

<style scoped>
div #select {
  color: #6a66d8;
  font-size: 40px;
}
</style>
