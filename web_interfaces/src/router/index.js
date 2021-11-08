import Vue from 'vue'
import VueRouter from 'vue-router'
import Dashboard from '@/components/Dashboard'
import WorkingTimes from '@/components/WorkingTimes'
import Users from '@/components/Users'
import Manage from '@/components/Manage'
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
      path: '/workingtimes/:user_id',
      name: 'Workingtimes',
      component: WorkingTimes
    },
    {
      path: '/manage',
      name: 'Manage',
      component: Manage
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
