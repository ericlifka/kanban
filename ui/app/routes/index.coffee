`import Ember from 'ember'`

IndexRoute = Ember.Route.extend
    beforeModel: ->
        @transitionTo 'dashboard'

`export default IndexRoute`
