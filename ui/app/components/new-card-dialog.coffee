`import Ember from 'ember'`
`import FocusFirstInputMixin from '../mixins/focus-first-input'`

NewCardDialogComponent = Ember.Component.extend FocusFirstInputMixin,
    actions:
        create: ->
            console.log 'create'
            false

`export default NewCardDialogComponent`