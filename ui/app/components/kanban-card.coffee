`import Ember from 'ember'`

KanbanCardComponent = Ember.Component.extend
    classNameBindings: [':kanban-card', 'activeCard']
    attributeBindings: ['draggable']

    draggable: "true"
    nameBinding: 'card.name'
    activeCard: false
    dragging: false

    drop: (event) ->
        console.log 'drop on card', @get 'card.id'

    dragOver: (event) ->
        if not @get 'dragging'
            @set 'activeCard', true

    dragLeave: (event) ->
        @set 'activeCard', false

    dragStart: (event) ->
        @set 'dragging', true
        event.dataTransfer.setData 'card', @get 'card.id'

    dragEnd: (event) ->
        @set 'dragging', false

`export default KanbanCardComponent`