`import Ember from 'ember'`

FocusFirstInputMixin = Ember.Mixin.create
    focusFirstInput: Ember.on 'init', ->
        Ember.run.scheduleOnce 'afterRender', @, ->
            @$('.first-input').focus()

`export default FocusFirstInputMixin`