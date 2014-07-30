`import Ember from 'ember'`

DragDropDelegateMixin = Ember.Mixin.create
    startDraggingCard: (component) ->
        component.set 'dragging', true
        @set 'cardBeingDragged', component

    dragOverCard: (component) ->
        if not component.get 'dragging'
            if @get 'activeCardComponent'
                @set 'activeCardComponent.activeCard', false

            component.set 'activeCard', true
            @set 'activeCardComponent', component

    dragOverColumn: (component) ->
        if @get 'activeColumnComponent'
            @set 'activeColumnComponent.activeColumn', false

        component.set 'activeColumn', true
        @set 'activeColumnComponent', component

    dropOnCard: (component) ->

    dropOnColumn: (component) ->

    stopDraggingCard: (component) ->
        if @get 'activeColumnComponent'
            @set 'activeColumnComponent.activeColumn', false
            @set 'activeColumnComponent', null

        if @get 'activeCardComponent'
            @set 'activeCardComponent.activeCard', false
            @set 'activeCardComponent', null

        if @get 'cardBeingDragged'
            @set 'cardBeingDragged.dragging', false
            @set 'cardBeingDragged', null

`export default DragDropDelegateMixin`