`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
    beforeModel: (transition) ->
        if transition.targetName not in ['about', 'register']
            @session.confirmSession().then ({authenticated}) =>
                if not authenticated
                    @transitionTo 'about'

    actions:
        loggedIn: ->
            @transitionTo 'index'

        loggedOut: ->
            @transitionTo 'about'

`export default ApplicationRoute`
