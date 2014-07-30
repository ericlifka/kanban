`import Ember from 'ember'`
`import DragDropDelegateMixin from '../../mixins/drag-drop-delegate'`

CardBoardController = Ember.ObjectController.extend DragDropDelegateMixin,
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

    actions:
        openNewCardDialog: ->
            @set 'newCardDialogVisible', true

        dismissNewCardDialog: ->
            @set 'newCardDialogVisible', false

`export default CardBoardController`