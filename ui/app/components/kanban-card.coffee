`import Ember from 'ember'`

KanbanCardComponent = Ember.Component.extend
    nameBinding: 'card.name'
    attributeBindings: ['draggable']
    draggable: "true"

    dragStart: (event) ->
        event.dataTransfer.setData 'text/data', @get 'card.id'

`export default KanbanCardComponent`