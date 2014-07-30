`import Ember from 'ember'`

DragDropDelegateMixin = Ember.Mixin.create
    startDraggingCard: (component) ->
        component.set 'dragging', true
        @set 'draggingCard', component

    dragOverCard: (component) ->
        if not component.get 'dragging'
            if @get 'activeCard'
                @set 'activeCard.active', false

            component.set 'active', true
            @set 'activeCard', component

    dragOverColumn: (component) ->
        if @get 'activeColumn'
            @set 'activeColumn.active', false

        component.set 'activeColumn', true
        @set 'activeColumn', component

    dropOnCard: (component) ->

    dropOnColumn: (component) ->

    stopDraggingCard: (component) ->
        if @get 'activeColumn'
            @set 'activeColumn.active', false
            @set 'activeColumn', null

        if @get 'activeCard'
            @set 'activeCard.active', false
            @set 'activeCard', null

        if @get 'draggingCard'
            @set 'draggingCard.dragging', false
            @set 'draggingCard', null

`export default DragDropDelegateMixin`