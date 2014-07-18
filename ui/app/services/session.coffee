`import Ember from 'ember'`

SessionService = Ember.Object.extend
    user: null

    authenticated: Ember.computed 'user', ->
        !!@get 'user'

    confirmSession: -> new Ember.RSVP.Promise (resolve) =>
        sessionUser = @get 'user'
        if sessionUser
            resolve {user: sessionUser, authenticated: true}
        else
            Ember.$.get '/auth/status', (response) =>
                if response.authenticated
                    @set 'user', response.user

                resolve response

    register: (username, password) ->
        @authRequest '/auth/register', username, password

    login: (username, password) ->
        @authRequest '/auth/login', username, password

    logout: -> new Ember.RSVP.Promise (resolve) =>
        request = Ember.$.ajax
            url: '/auth/logout'
            type: 'POST'

        request.always =>
            @set 'user', null
            resolve()

    authRequest: (endpoint, username, password) -> new Ember.RSVP.Promise (resolve) =>
        request = Ember.$.ajax
            url: endpoint
            type: 'POST'
            data: {username, password}

        request.done (user, status, xhr) =>
            @set 'user', user
            resolve {authenticated: true, user, status: xhr.status}

        request.fail (xhr) ->
            resolve {authenticated: false, status: xhr.status}

`export default SessionService`