`import Ember from 'ember'`

IndexRoute = Ember.Route.extend
    model: ->
        ['red', 'blue', 'yellow']

`export default IndexRoute`
