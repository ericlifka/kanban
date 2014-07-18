`import Ember from 'ember'`

pages = [
    'dashboard'
]

NavBarComponent = Ember.Component.extend
    activePage: null

    navigationPages: Ember.computed 'activePage', ->
        active = @get 'activePage'
        for page in pages
            active: page is active
            href: "#/#{page}"
            display: page

    loginError: false

    passwordError: null
    usernameError: null

    passwordWarning: Ember.computed 'registrationPassword', 'passwordRepeat', ->
        password = @get 'registrationPassword'
        repeat = @get 'passwordRepeat'
        password and repeat and password isnt repeat

    actions:
        login: ->
            @set 'loginError', false
            username = @get 'loginUsername'
            password = @get 'loginPassword'
            @session.login(username, password).then ({authenticated}) =>
                if not authenticated
                    @set 'loginError', true
                else
                    @set 'loginUsername', ''
                    @set 'loginPassword', ''
                    @triggerAction action: 'loggedIn'
            return

        logout: ->
            @session.logout().then =>
                @triggerAction action: 'loggedOut'

        register: ->
            @set 'passwordError', null
            @set 'usernameError', null

            username = @get 'registrationUsername'
            password = @get 'registrationPassword'
            passwordRepeat = @get 'passwordRepeat'

            if password isnt passwordRepeat
                @set 'passwordError', true
                @set 'registrationError', "Password fields don't match"
                return

            @session.register(username, password).then ({authenticated, status}) =>
                if authenticated
                    @set 'modalOpen', false
                    @triggerAction action: 'loggedIn'
                else
                    @set 'usernameError', true
                    @set 'registrationError', switch status
                        when 400 then "Username and Password are required"
                        when 409 then "Username is already in use"
                        when 500 then "Couldn't create user for username"
                        else "Registration failed"

        openRegistrationModal: ->
            @set 'modalOpen', true

        closeRegistrationModal: ->
            @set 'modalOpen', false

`export default NavBarComponent`