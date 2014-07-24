`import Ember from 'ember'`

KanbanColumnComponent = Ember.Component.extend
    classNames: ['kanban-column', 'col-sm-3']

    nameBinding: 'column.name'

    cards: Ember.computed 'column.cards.@each.rank', ->
        cards = @get 'column.cards'
        _.sortBy cards, (card) -> card.rank

    dragOver: (event) ->
        event.preventDefault()

    drop: (event) ->
        cardId = event.dataTransfer.getData 'card'
        console.log 'dropped ', cardId, ' on ', @get('column.name'), @get 'column.column'

`export default KanbanColumnComponent`