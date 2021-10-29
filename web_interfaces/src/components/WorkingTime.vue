<template>
  <div>
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