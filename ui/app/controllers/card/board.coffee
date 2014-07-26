`import Ember from 'ember'`

CardBoardController = Ember.ObjectController.extend
    #TODO: server loaded columns to allow configuration
    columnDescriptions: [
        {column: 0, name: 'preparing'}
        {column: 1, name: 'doing'}
        {column: 2, name: 'verifying'}
        {column: 3, name: 'releasing'}
    ]

    columns: Ember.computed 'model.cards.@each.column', ->
        cards = @get 'model.cards'
        columnGroups = _.groupBy cards, (card) -> card.get 'column'
        _.collect @columnDescriptions, (description) ->
            column: description.column
            name: description.name
            cards: columnGroups[description.column]

    actions:
        newCard: -> false

`export default CardBoardController`