`import Ember from 'ember'`

NewCardDialogComponent = Ember.Component.extend
    focusFirstInput: Ember.on 'init', ->
        Ember.run.scheduleOnce 'afterRender', @, ->
            @$('.first-input').focus()

    actions:
        create: ->
            console.log 'create'
            false

`export default NewCardDialogComponent`