import Vue from 'vue'
import VueRouter from 'vue-router'
import Dashboard from '@/components/Dashboard'
import WorkingTimes from '@/components/WorkingTimes'
import User from '@/components/User'
import Users from '@/components/Users'
import ClockManager from '@/components/ClockManager'
import ChartManager from '@/components/ChartManager'

Vue.use(VueRouter)

export default new VueRouter({
  routes: [
    {
      path: '/users/:id',
      name: 'Dashboard',
      component: Dashboard
    },
    {
      path: '/users',
      name: 'Users',
      component: Users
    },
    {
      path: '/users/:id',
      name: 'User',
      component: User
    },
    {
      path: '/workingtimes/:user_id',
      name: 'Workingtimes',
      component: WorkingTimes
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
