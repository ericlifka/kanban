`import Ember from 'ember'`

pages = [
    {route: 'about', display: 'about'}
    {route: 'dashboard', display: 'dashboard', auth: true}
    {route: 'card.board', display: 'kanban', dynamic: true, auth: true}
    {route: 'card.plan', display: 'planning', dynamic: true, auth: true}
]

NavBarComponent = Ember.Component.extend
    activePage: null
    authenticatedBinding: 'session.authenticated'
    lastProjectBinding: 'session.lastProject'

    navigationPages: Ember.computed 'activePage', 'authenticated', 'lastProject', ->
        authenticated = @get 'authenticated'
        active = @get 'activePage'
        lastProject = @get 'lastProject'

        descriptions = _.collect pages, (page) ->
            if page.auth and not authenticated
                false
            else if page.dynamic and not lastProject
                false
            else
                active: page.route is active
                display: page.display
                dynamic: page.dynamic
                route: page.route
                model: if page.dynamic then lastProject else null

        _.filter descriptions, (page) -> page

    loginError: false

    passwordError: null
    usernameError: null

    passwordWarning: Ember.computed 'registrationPassword', 'passwordRepeat', ->
        password = @get 'registrationPassword'
        repeat = @get 'passwordRepeat'
        password and repeat and password isnt repeat

    hasFeedback: Ember.computed 'passwordWarning', 'passwordError', ->
        @get('passwordWarning') or @get('passwordError')

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
            @session.logout()

        register: ->
            @set 'passwordError', null
            @set 'usernameError', null

            username = @get 'registrationUsername'
            password = @get 'registrationPassword'
            passwordRepeat = @get 'passwordRepeat'

            if password isnt passwordRepeat
                @set 'passwordError', true
                @set 'registrationError', "<strong>Error!</strong> Password fields don't match"
                return

            @session.register(username, password).then ({authenticated, status}) =>
                if authenticated
                    @set 'modalOpen', false
                    @triggerAction action: 'loggedIn'
                else
                    @set 'usernameError', true
                    @set 'registrationError', switch status
                        when 400 then "<strong>Error!</strong> All fields are required"
                        when 409 then "Username is already in use"
                        when 500 then "Couldn't create user for username"
                        else "Registration failed"

        openRegistrationModal: ->
            @set 'modalOpen', true
            Ember.run.scheduleOnce 'afterRender', @, @focusFirstInput

        closeRegistrationModal: ->
            @set 'modalOpen', false

    focusFirstInput: ->
        @$('.first-input').focus()

`export default NavBarComponent`