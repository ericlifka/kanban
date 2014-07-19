`import Ember from 'ember'`

AccountController = Ember.ObjectController.extend
    changePasswordOld: ''
    changePasswordNew: ''
    changePasswordRepeat: ''
    passwordUpdateSucceeded: false

    passwordMatchWarning: Ember.computed 'changePasswordNew', 'changePasswordRepeat', ->
        password = @get 'changePasswordNew'
        repeat = @get 'changePasswordRepeat'
        password and repeat and password isnt repeat

    readyToSubmit: Ember.computed 'changePasswordOld', 'changePasswordNew', 'changePasswordRepeat', 'passwordMatchWarning', ->
        @get('changePasswordOld') and @get('changePasswordNew') and @get('changePasswordRepeat') and not @get('passwordMatchWarning')

    alertType: Ember.computed 'passwordUpdateSucceeded', 'passwordUpdateFailed', ->
        if @get 'passwordUpdateSucceeded'
            'alert-success'
        else if @get 'passwordUpdateFailed'
            'alert-danger'
        else
            'hidden'

    alertText: Ember.computed 'passwordUpdateSucceeded', 'passwordUpdateFailed', ->
        if @get 'passwordUpdateSucceeded'
            "<strong>Success!</strong> You've updated your password."
        else if @get 'passwordUpdateFailed'
            "<strong>Error!</strong> We couldn't authenticate you"
        else
            ''

    actions:
        changePassword: ->
            @set 'passwordUpdateSucceeded', false
            @set 'passwordUpdateFailed', false

            oldpass = @get 'changePasswordOld'
            newpass = @get 'changePasswordNew'
            repeat = @get 'changePasswordRepeat'

            if oldpass and newpass and repeat and newpass is repeat
                @session.changePassword(oldpass, newpass).then (success) =>
                    if success
                        @set 'changePasswordOld', ''
                        @set 'changePasswordNew', ''
                        @set 'changePasswordRepeat', ''
                        @set 'passwordUpdateSucceeded', true
                    else
                        @set 'passwordUpdateFailed', true

`export default AccountController`