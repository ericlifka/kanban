`import Ember from 'ember'`

LoginRoute = Ember.Route.extend
    actions:
        register: ->
            @transitionTo 'register'

`export default LoginRoute`
