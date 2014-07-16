`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
    beforeModel: ->
        @session.confirmSession().then ({user, authenticated}) =>
            if not authenticated
                @transitionTo 'login'

`export default ApplicationRoute`
