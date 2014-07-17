`import Ember from 'ember'`

RegisterRoute = Ember.Route.extend
    actions:
        cancel: ->
            @transitionTo 'login'

        authenticated: ->
            @transitionTo 'index'

`export default RegisterRoute`