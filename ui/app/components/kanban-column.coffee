`import Ember from 'ember'`

KanbanColumnComponent = Ember.Component.extend
    classNames: ['kanban-column', 'col-sm-3']

    nameBinding: 'column.name'

    cards: Ember.computed 'column.cards.@each.rank', ->
        cards = @get 'column.cards'
        _.sortBy cards, (card) -> card.rank

`export default KanbanColumnComponent`