`import Ember from 'ember'`

RegisterRoute = Ember.Route.extend
    actions:
        cancel: ->
            @transitionTo 'login'

`export default RegisterRoute`