`import Ember from 'ember'`

DashboardRoute = Ember.Route.extend
    model: -> ['red', 'blue', 'green', 'brown', 'poop']

`export default DashboardRoute`
