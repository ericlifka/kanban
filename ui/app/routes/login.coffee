`import Ember from 'ember'`

LoginRoute = Ember.Route.extend
    actions:
        register: ->
            @transitionTo 'register'

        authenticated: ->
            @transitionTo 'index'

`export default LoginRoute`
