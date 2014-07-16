`import Ember from 'ember'`

SessionService = Ember.Object.extend
    user: null

    confirmSession: -> new Ember.RSVP.Promise (resolve) =>
        sessionUser = @get 'user'
        if sessionUser
            resolve {user: sessionUser, authenticated: true}
        else
            $.get '/auth/status', (response) =>
                if response.authenticated
                    @set 'user', response.user

                resolve response

`export default SessionService`
