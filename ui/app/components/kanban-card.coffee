`import Ember from 'ember'`

KanbanCardComponent = Ember.Component.extend
    nameBinding: 'card.name'
    attributeBindings: ['draggable']
    draggable: "true"

    drop: (event) ->
        console.log 'drop on card', @get 'card.id'

    dragStart: (event) ->
        event.dataTransfer.setData 'card', @get 'card.id'

`export default KanbanCardComponent`