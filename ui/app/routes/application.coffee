`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
    beforeModel: (transition) ->
        if transition.targetName not in ['login', 'register']
            @session.confirmSession().then ({user, authenticated}) =>
                if not authenticated
                    @transitionTo 'login'

`export default ApplicationRoute`
