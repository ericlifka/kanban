`import Ember from 'ember'`

SessionService = Ember.Object.extend
    user: null
    lastCard: null

    authenticated: Ember.computed 'user', ->
        !!@get 'user'

    loadLastProjectOnLogin: Ember.observer 'user', 'authenticated', ->
        authenticated = @get 'authenticated'
        username = @get 'user.username'
        if authenticated and username
            cardId = window.localStorage?.getItem "#{username}.last_card"
            if cardId
                @store.find('card', cardId).then (card) =>
                    @set 'lastCard', card

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

    changeLastCard: (card) ->
        @set 'lastCard', card
        @cacheLastCardId()

    cacheLastCardId: ->
        cardId = @get 'lastCard.id'
        username = @get 'user.username'
        if username and cardId
            window.localStorage?.setItem "#{username}.last_card", cardId

`export default SessionService`