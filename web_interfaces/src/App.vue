<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
      <div class="d-flex align-center">
      <v-toolbar-title>
        Time Manager
      </v-toolbar-title>
      <v-toolbar-items>
        <v-btn color="">
          <router-link to="/">Home</router-link>
        </v-btn>
        <v-btn>
          <router-link to="/users">User</router-link>
        </v-btn>
        <v-btn >
          <router-link to="/workingtimes">Workingtimes</router-link>
        </v-btn>
        <v-btn >
          <router-link to="/workingtime">Workingtime</router-link>
        </v-btn>
        <v-btn >
          <router-link to="/clock">ClockManager</router-link>
        </v-btn>
        <v-btn >
          <router-link to="/chart">ChartManager</router-link>
        </v-btn>
      </v-toolbar-items>
      </div>

      <v-spacer></v-spacer>
    </v-app-bar>

    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'App',

  data: () => ({
    //
  }),
};
</script>
