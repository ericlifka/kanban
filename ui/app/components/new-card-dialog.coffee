`import Ember from 'ember'`
`import FocusFirstInputMixin from '../mixins/focus-first-input'`

NewCardDialogComponent = Ember.Component.extend FocusFirstInputMixin,
    classNames: ['new-card-dialog']

    actions:
        create: ->
            name = @get 'name'
            description = @get 'description'
            parent = @get 'parent.id'
            projectId = @get 'parent.projectId'
            column = 0

            if not name
                return @set 'validationError', true

            cardDefinition = {name, description, parent, projectId, column}
            newCard = @store.createRecord 'card', cardDefinition
            newCard.save().then( =>
                @sendAction()
            ).catch =>
                newCard.deleteRecord()
                @set 'creationError', true
            false

        close: ->
            @sendAction()

`export default NewCardDialogComponent`