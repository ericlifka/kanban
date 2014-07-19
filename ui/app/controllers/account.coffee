`import Ember from 'ember'`

AccountController = Ember.ObjectController.extend
    changePasswordOld: ''
    changePasswordNew: ''
    changePasswordRepeat: ''

    passwordMatchWarning: Ember.computed 'changePasswordNew', 'changePasswordRepeat', ->
        password = @get 'changePasswordNew'
        repeat = @get 'changePasswordRepeat'
        password and repeat and password isnt repeat

    readyToSubmit: Ember.computed 'changePasswordOld', 'changePasswordNew', 'changePasswordRepeat', 'passwordMatchWarning', ->
        @get('changePasswordOld') and @get('changePasswordNew') and @get('changePasswordRepeat') and not @get('passwordMatchWarning')

    actions:
        changePassword: ->
            oldpass = @get 'changePasswordOld'
            newpass = @get 'changePasswordNew'
            repeat = @get 'changePasswordRepeat'

#            @setSpinner()
            if oldpass and newpass and repeat and newpass is repeat
                @set 'changePasswordOld', ''
                @set 'changePasswordNew', ''
                @set 'changePasswordRepeat', ''
                @session.changePassword(oldpass, newpass).then (success) =>


`export default AccountController`