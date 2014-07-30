`import Ember from 'ember'`

KanbanCardComponent = Ember.Component.extend
    classNameBindings: [':kanban-card', 'active:active-card']
    attributeBindings: ['draggable']

    draggable: "true"
    nameBinding: 'card.name'
    activeCard: false
    dragging: false
    delegate: null

    drop: (event) ->
        @delegate.dropOnCard @

#        cardId = event.dataTransfer.getData 'card'
#        if cardId is @get 'card.id'
#            event.stopPropagation()
#            return # didn't move card at all
#
#        event.droppedOnId = @get 'card.id'
#
#        console.log 'dropped ', cardId, ' on ', @get 'card.id'
#        @set 'activeCard', false

    dragOver: (event) ->
        event.preventDefault()
        @delegate.dragOverCard @

#        if not @get 'dragging'
#            @set 'activeCard', true

    dragStart: (event) ->
        event.stopPropagation()
        @delegate.startDraggingCard @

#        @set 'dragging', true
#        event.dataTransfer.setData 'card', @get 'card.id'

    dragEnd: (event) ->
        event.stopPropagation()
        @delegate.stopDraggingCard @

`export default KanbanCardComponent`