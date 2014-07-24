`import Ember from 'ember'`

KanbanCardComponent = Ember.Component.extend
    nameBinding: 'card.name'
    attributeBindings: ['draggable']
    draggable: "true"

`export default KanbanCardComponent`