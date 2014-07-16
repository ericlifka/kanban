`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
    beforeModel: ->
        console.log 'application route beforeModel hook'

`export default ApplicationRoute`
