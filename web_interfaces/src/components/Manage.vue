<template>
  <v-container class="mt-4">
    <v-container class="text-center mb-8">
      <h2>Manage my teams</h2>
      <v-card :elevation="6" class="ma-4 pa-8" v-for="team in teams" :key="team.id">
        <p>{{team.user.email}}</p>
        <p>{{team.id}}</p>
      </v-card>
    </v-container>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  name: "Manage",
  data() {
    return {
      teams: [],
      path: "http://localhost:4000/api/teams",
      userId: 1,
    };
  },
  mounted() {
    this.getTeams(this.userId);
  },
  methods: {
    getTeams(user_id) {
      axios
        .get(this.path + "/" + this.userId)
        .then((response) => {
          console.log(response.data.data);
          this.teams = response.data.data;
        })
        .catch((err) => console.log(err.message));
    }
  },
};
</script>

<style>
</style>