`import Ember from 'ember'`

AccountRoute = Ember.Route.extend
    model: ->
        @session.get 'user'

`export default AccountRoute`
