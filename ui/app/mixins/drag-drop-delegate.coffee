`import Ember from 'ember'`

DragDropDelegateMixin = Ember.Mixin.create
    startDraggingCard: (component) ->
        component.set 'dragging', true
        @set 'draggingCard', component

    dragOverCard: (component) ->
        if not component.get 'dragging'
            @clearCard()

            component.set 'active', true
            @set 'activeCard', component

    dragOverColumn: (component) ->
        @clearColumn()

        component.set 'activeColumn', true
        @set 'activeColumn', component

    dropOnCard: (component) ->

    dropOnColumn: (component) ->

    stopDraggingCard: (component) ->
        @clearColumn()
        @clearCard()
        @clearDragging()


    # Helpers
    clearColumn: ->
        if @get 'activeColumn'
            @set 'activeColumn.active', false
            @set 'activeColumn', null

    clearCard: ->
        if @get 'activeCard'
            @set 'activeCard.active', false
            @set 'activeCard', null

    clearDragging: ->
        if @get 'draggingCard'
            @set 'draggingCard.dragging', false
            @set 'draggingCard', null

`export default DragDropDelegateMixin`