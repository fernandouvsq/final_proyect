<template>
</template>

<script>
import ColumnChart from './charts/ColumnChart.vue'
import PieChart from './charts/PieChart.vue'
import LineChart from './charts/LineChart.vue'

export default {
  name: 'ChartManager',
  components: {
    PieChart,
    ColumnChart,
    LineChart
  }
}
</script>

<style scoped>
</style>