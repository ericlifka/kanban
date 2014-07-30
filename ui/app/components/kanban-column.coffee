`import Ember from 'ember'`

KanbanColumnComponent = Ember.Component.extend
    classNameBindings: [':kanban-column', 'activeColumn', ':col-sm-3']

    delegate: null
    position: null
    description: null
    cards: null

    activeColumn: false

    sortedCards: Ember.computed 'cards.@each.rank', ->
        _.sortBy @get('cards'), (card) -> card.get 'rank'

    dragOver: (event) ->
        event.preventDefault()
        @delegate.dragOverColumn @

    drop: (event) ->
        event.preventDefault()
        @delegate.dropOnColumn @

#    drop: (event) ->
#        draggedCardId = event.dataTransfer.getData 'card'
#        droppedOnId = event.droppedOnId
#
#        draggedCard = @store.getById 'card', draggedCardId
#        droppedCard = @store.getById 'card', droppedOnId
#        #TODO do something with rankings to make cards ordered or something
#        draggedCard.set 'column', @get 'position'
#        console.log draggedCard
#        draggedCard.save()
#
#        console.log 'drop on column', @get 'description.name'
#        console.log event.someProperty
#        @set 'activeColumn', false
##        cardId = event.dataTransfer.getData 'card'
##        dropOnId = event.dataTransfer.getData 'dropOn'
##        console.log 'dropOnId', dropOnId
##        @store.find('card', cardId).then (card) =>
##            card.set 'column', @get 'column.column'
##            card.save()

`export default KanbanColumnComponent`