`import Ember from 'ember'`

LoginController = Ember.Controller.extend
    loginError: null

    actions:
        login: ->
            if @get 'loginError'
                @set 'loginError', null

            username = @get 'username'
            password = @get 'password'
            @session.login(username, password).then ({authenticated, user, status}) =>
                if authenticated
                    @send 'authenticated'
                else
                    console.log status
                    error = switch status
                        when 400 then "Username and Password are required"
                        when 401 then "Invalid credentials"
                        else "Login failed"

                    @set 'loginError', error


`export default LoginController`