<template>
  <div>
    <v-form>
      <v-container>
        <v-row>
          <v-col cols="3" sm="6" md="3">
            <input type="date" v-model="dateStart" placeholder="Date de début">
            <input type="date" v-model="dateEnd" placeholder="Date de fin">
            <v-btn v-on:click="createWorkingTime" color="accent" elevation="2">Créer</v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
    <div class="create-workingTime">
    </div>
    <button v-on:click="deleteWorkingTime(this.id)">Delete Working Time</button>
  </div>
</template>

<script>

export default {
  name: 'WorkingTime',
  data () {
    return {
      path: 'http://localhost:4000/api/workingtimes',
      dateStart: null,
      dateEnd: null,
      id: 1
    }
  },
  methods: {
    createWorkingTime () {
    },
    updateWorkingTime () {
    },
    deleteWorkingTime (id) {
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