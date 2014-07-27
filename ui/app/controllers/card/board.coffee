`import Ember from 'ember'`

CardBoardController = Ember.ObjectController.extend
    newCardDialogVisible: false
    title: ""

    columns: Ember.computed 'model.cards.@each.column', 'model.columns.[]', ->
        columnGroups = _.groupBy @get('model.cards'), (card) -> card.get 'column'
        columns = @get 'model.columns'

        for i in [0...columns.length]
            column = columns[i]
            cards = columnGroups[i]
            {
                position: i
                description: column
                cards: cards
            }

    setTitle: Ember.observer 'model.name', ->
        cardName = @get 'model.name'
        if cardName isnt 'topCard'
            @set 'title', cardName
        else
            @store.find('project', @get 'model.projectId').then (project) =>
                @set 'title', project.get 'name'

    actions:
        openNewCardDialog: ->
            @set 'newCardDialogVisible', true

        dismissNewCardDialog: ->
            @set 'newCardDialogVisible', false

`export default CardBoardController`