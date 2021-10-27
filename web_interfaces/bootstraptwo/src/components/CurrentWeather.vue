<template>
  <!--<button type="button" @click="count++">count is: {{ count }}</button>-->
  <div>
    <div id="select">
      <label>Choose the city</label>
      <div>
        <select v-model="selected.citie">
          <option v-for="(citie, key) in cities" :value="key">
            {{ citie }}
          </option>
        </select>
      </div>
    </div>

    <div>
      <h2>Météo actuelle à {{ cities[selected.citie] }}</h2>
      <div>
        <button v-on:click="refreshCurrentWeather('hi')">random date</button>
      </div>
      <div>
        <h4>Temperature: {{ temperature }}°C</h4>
        <h4>Date: {{ date }}</h4>
      </div>
    </div>
  </div>
</template>

<script>
import moment from "moment";

export default {
  data: function () {
    return {
      temperature: "12",
      date: moment().format("“YYYY-MM-DD hh:mm:ss"),
      cities: ["Lyon", "Paris", "Bordeaux"],
      selected: {
        citie: undefined,
      },
    };
  },
  methods: {
    refreshCurrentWeather: function () {
      var rdmdate = [
        "27th 2018, 6:34:33 pm",
        "22th 2025, 3:46:57 pm",
        "7th 2021, 2:34:53 pm",
      ];
      this.date = rdmdate[getRandomInt(3)];
    },
  },
};

function getRandomInt(max) {
  return Math.floor(Math.random() * max);
}
</script>

<style scoped>
div #select {
  color: #6a66d8;
  font-size: 40px;
}
</style>
