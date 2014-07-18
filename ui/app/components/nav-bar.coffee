`import Ember from 'ember'`

NavBarComponent = Ember.Component.extend
    loginError: false

    actions:
        login: ->
            if @get 'loginError' then @set 'loginError', false
            username = @get 'loginUsername'
            password = @get 'loginPassword'
            @session.login(username, password).then ({authenticated, user, status}) =>
                if not authenticated
                    @set 'loginError', true
                else
                    @set 'loginUsername', ''
                    @set 'loginPassword', ''
                    @triggerAction action: 'loggedIn'
            return

        register: ->
            console.log 'register'

        logout: ->
            @session.logout().then =>
                @triggerAction action: 'loggedOut'

`export default NavBarComponent`