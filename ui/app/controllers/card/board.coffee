`import Ember from 'ember'`

CardBoardController = Ember.ObjectController.extend
    newCardDialogVisible: false
    title: ""

    columns: Ember.computed 'model.children.@each.column', 'model.columns.[]', ->
        children = @get('model.children').toArray()
        columnGroups = _.groupBy children, (card) -> card.get 'column'
        columns = @get 'model.columns'

        for i in [0...columns.length]
            position: i
            description: columns[i]
            cards: columnGroups[i]

    setTitle: Ember.observer 'model.name', ->
        cardName = @get 'model.name'
        if cardName isnt 'topCard'
            @set 'title', cardName
        else
            @store.find('project', @get 'model.projectId').then (project) =>
                @set 'title', project.get 'name'

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

    actions:
        openNewCardDialog: ->
            @set 'newCardDialogVisible', true

        dismissNewCardDialog: ->
            @set 'newCardDialogVisible', false

`export default CardBoardController`