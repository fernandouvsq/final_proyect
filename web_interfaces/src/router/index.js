import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '@/components/HelloWorld'
import WorkingTimes from '@/components/WorkingTimes'
import WorkingTime from '@/components/WorkingTime'
import User from '@/components/User'
import ClockManager from '@/components/ClockManager'
import ChartManager from '@/components/ChartManager'

Vue.use(VueRouter)

export default new VueRouter({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/user',
      name: 'User',
      component: User
    },
    {
      path: '/workingtimes',
      name: 'Workingtimes',
      component: WorkingTimes
    },
    {
      path: '/workingtime',
      name: 'Workingtime',
      component: WorkingTime
    },
    {
      path: '/clock',
      name: 'ClockManager',
      component: ClockManager
    },
    {
      path: '/chart',
      name: 'ChartManager',
      component: ChartManager
    }
  ]
})
