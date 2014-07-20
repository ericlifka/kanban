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

`export default NewProjectControlComponent`