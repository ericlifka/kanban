`import Ember from 'ember'`

KanbanCardComponent = Ember.Component.extend
    classNameBindings: [':kanban-card', 'activeCard']
    attributeBindings: ['draggable']

    draggable: "true"
    nameBinding: 'card.name'
    activeCard: false
    dragging: false

    drop: (event) ->
        cardId = event.dataTransfer.getData 'card'
        if cardId is @get 'card.id'
            event.stopPropagation()
            return # didn't move card at all

        event.droppedOnId = @get 'card.id'

        console.log 'dropped ', cardId, ' on ', @get 'card.id'
        @set 'activeCard', false

    dragOver: (event) ->
        event.preventDefault()
        if not @get 'dragging'
            @set 'activeCard', true

    dragLeave: (event) ->
        @set 'activeCard', false
#        event.preventDefault()

    dragStart: (event) ->
        @set 'dragging', true
        event.dataTransfer.setData 'card', @get 'card.id'

    dragEnd: (event) ->
        @set 'dragging', false

`export default KanbanCardComponent`