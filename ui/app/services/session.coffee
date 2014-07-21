`import Ember from 'ember'`

SessionService = Ember.Object.extend
    user: null
    lastProject: null

    authenticated: Ember.computed 'user', ->
        !!@get 'user'

    loadLastProjectOnLogin: Ember.observer 'user', 'authenticated', ->
        authenticated = @get 'authenticated'
        username = @get 'user.username'
        if authenticated and username
            projectId = window.localStorage?.getItem "#{username}.last_project"
            if projectId
                @store.find('project', projectId).then (project) =>
                    @set 'lastProject', project

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

    logout: ->
        Ember.$.ajax(
            url: '/auth/logout'
            type: 'POST'
        ).always ->
            location.reload()

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

    changePassword: (oldPassword, newPassword) -> new Ember.RSVP.Promise (resolve) =>
        username = @get 'user.username'
        request = Ember.$.ajax
            url: '/auth/password'
            type: 'PUT'
            data: {username, oldPassword, newPassword}

        request.done (user, status, xhr) ->
            resolve xhr.status is 200

        request.fail (xhr) ->
            console.log "Password request failed: ", xhr.status, xhr
            resolve false

    changeProject: (project) ->
        @set 'lastProject', project
        @cacheLastProjectId()

    cacheLastProjectId: ->
        projectId = @get 'lastProject.id'
        username = @get 'user.username'
        if username and projectId
            window.localStorage?.setItem "#{username}.last_project", projectId

`export default SessionService`