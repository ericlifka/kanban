`import Ember from 'ember'`
`import FocusFirstInputMixin from '../mixins/focus-first-input'`

NewCardDialogComponent = Ember.Component.extend FocusFirstInputMixin,
    classNames: ['new-card-dialog']

    actions:
        create: ->
            parentModel = @get 'parent'

            name = @get 'name'
            description = @get 'description'
            parent = parentModel.get 'id'
            projectId = parentModel.get 'projectId'
            column = 0

            if not name
                return @set 'validationError', true

            cardDefinition = {name, description, parent, projectId, column}
            newCard = @store.createRecord 'card', cardDefinition
            newCard.save().then( =>
                parentModel.cards.pushObject newCard
                @sendAction()
            ).catch =>
                newCard.deleteRecord()
                @set 'creationError', true
            false

        close: ->
            @sendAction()

`export default NewCardDialogComponent`