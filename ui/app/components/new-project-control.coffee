`import Ember from 'ember'`

NewProjectControlComponent = Ember.Component.extend
    focusInput: ->
        @$('.first-input').focus()

    actions:
        toggleFormOn: ->
            @set 'formOn', true
            Ember.run.scheduleOnce 'afterRender', @, @focusInput

        toggleFormOff: ->
            @set 'formOn', false

        createProject: ->
            name = @get 'newProjectName'
            description = @get 'newProjectDescription'

            if not name or not description
                @set 'newProjectError', true
            else
                

`export default NewProjectControlComponent`