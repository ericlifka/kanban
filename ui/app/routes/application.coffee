`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
    beforeModel: (transition) ->
        @session.confirmSession().then ({authenticated}) =>
            if not authenticated and transition isnt 'about'
                @transitionTo 'about'

    actions:
        loggedIn: ->
            @transitionTo 'index'

        loggedOut: ->
            @transitionTo 'about'

`export default ApplicationRoute`
