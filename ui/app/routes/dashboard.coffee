`import Ember from 'ember'`

DashboardRoute = Ember.Route.extend
    model: ->
        @store.find 'project'

`export default DashboardRoute`
