`import Ember from 'ember'`

KanbanColumnComponent = Ember.Component.extend
    classNameBindings: [':kanban-column', 'activeColumn', ':col-sm-3']

    activeColumn: false
    nameBinding: 'column.name'

    cards: Ember.computed 'column.cards.@each.rank', ->
        cards = @get 'column.cards'
        _.sortBy cards, (card) -> card.rank

    dragOver: (event) ->
        @set 'activeColumn', true

    dragLeave: (event) ->
        @set 'activeColumn', false

    drop: (event) ->
        console.log 'drop on column', @get 'column.name'
#        cardId = event.dataTransfer.getData 'card'
#        dropOnId = event.dataTransfer.getData 'dropOn'
#        console.log 'dropOnId', dropOnId
#        @store.find('card', cardId).then (card) =>
#            card.set 'column', @get 'column.column'
#            card.save()

`export default KanbanColumnComponent`