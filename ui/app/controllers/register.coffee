`import Ember from 'ember'`

RegisterController = Ember.Controller.extend
    registrationError: null

    passwordWarning: Ember.computed 'password', 'passwordRepeat', ->
        password = @get 'password'
        repeat = @get 'passwordRepeat'
        password and repeat and password isnt repeat

    actions:
        register: ->
            if @get 'registrationError'
                @set 'registrationError', null

            username = @get 'username'
            password = @get 'password'
            passwordRepeat = @get 'passwordRepeat'

            if password isnt passwordRepeat
                @set 'registrationError', "Password fields don't match"
            else
                @session.register(username, password).then ({authenticated, user, status}) =>
                    if authenticated
                        @send 'authenticated'
                    else
                        error = switch status
                            when 409 then "Username is already in use"
                            when 500 then "Couldn't create user for username"
                            else "Registration failed"

                        @set 'registrationError', error
            return

`export default RegisterController`