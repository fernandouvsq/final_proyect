<template>
  <div>
<!--     <line-chart :data="{'2017-05-13': 2, '2017-05-14': 5}"></line-chart>
 -->    
  <b-container class="bv-example-row">
    <!-- Stack the columns on mobile by making one full-width and the other half-width -->
    <b-row>
      <b-col class="cardCharts" cols="12" md="7" sm="12">
        <PieChart/>
      </b-col>
      <b-col id="cardtwo" class="cardCharts" cols="6" md="4" sm="12">
        <ColumnChart/>
      </b-col>
    </b-row>
    <br>
    <br>
    <b-row>
      <b-col class="cardCharts" cols="12" md="12">
        <LineChart/>
      </b-col>
    </b-row>
  </b-container>
  </div>
</template>

<script>
import ColumnChart from './Charts/ColumnChart.vue'
import PieChart from './Charts/PieChart.vue'
import LineChart from './Charts/LineChart.vue'

export default {
  name: 'App',
  components: {
    PieChart,
    ColumnChart,
    LineChart
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.cardCharts{
  border: 1px black solid;
  border-radius: 20px;
  box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.562);
}
@media (min-width: 1050px) { 
  #cardtwo{
    margin-left: 8%;
  }
 }
</style>
