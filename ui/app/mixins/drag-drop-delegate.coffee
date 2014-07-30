`import Ember from 'ember'`

DragDropDelegateMixin = Ember.Mixin.create
    startDraggingCard: (component) ->
        component.set 'dragging', true
        @set 'draggingCard', component

    dragOverCard: (component) ->
        if not component.get 'dragging'
            @clearCard()
            @clearWell()

            component.set 'active', true
            @set 'activeCard', component

            @set 'activeColumn.bottomZoneActive', false

    dragOverColumn: (component) ->
        @clearColumn()

        component.set 'active', true
        component.set 'bottomZoneActive', true
        @set 'activeColumn', component

    dragOverBottomWell: (component) ->
        @clearCard()

        component.set 'active', true
        @set 'activeWell', component

    dropOnCard: (component) ->
        console.log "card: #{component.get('card.name')}"

    dropOnColumn: (component) ->
        console.log "column: #{component.get('description.name')}"

    dropOnWell: (component) ->
        console.log "drop well: #{component.get('column')}"

    stopDraggingCard: (component) ->
        @clearColumn()
        @clearCard()
        @clearWell()
        @clearDragging()


    # Helpers
    clearColumn: ->
        if @get 'activeColumn'
            @set 'activeColumn.active', false
            @set 'activeColumn.bottomZoneActive', false
            @set 'activeColumn', null

    clearCard: ->
        if @get 'activeCard'
            @set 'activeCard.active', false
            @set 'activeCard', null

    clearWell: ->
        if @get 'activeWell'
            @set 'activeWell.active', false
            @set 'activeWell', null

    clearDragging: ->
        if @get 'draggingCard'
            @set 'draggingCard.dragging', false
            @set 'draggingCard', null

`export default DragDropDelegateMixin`