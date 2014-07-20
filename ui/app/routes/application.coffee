`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
    beforeModel: (transition) ->
        @checkSessionBeforeTransition transition

    actions:
        willTransition: (transition) ->
            @checkSessionBeforeTransition transition

        loggedIn: ->
            @transitionTo 'dashboard'

    checkSessionBeforeTransition: (transition) ->
        if transition.targetName is 'index'
            @transitionTo 'dashboard'
            return

        @changeActivePage transition
        @session.confirmSession().then ({authenticated}) =>
            if not authenticated and transition.targetName isnt 'about'
                @transitionTo 'about'

    changeActivePage: (transition) ->
        SimplyKanban.set 'lastPage', SimplyKanban.get('currentPage') or '#'
        SimplyKanban.set 'currentPage', transition.targetName

`export default ApplicationRoute`
