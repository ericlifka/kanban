`import Ember from 'ember'`

BoardController = Ember.ObjectController.extend
    columnDefinitions: [
        {rank: 0, name: 'preparing'}
        {rank: 1, name: 'doing'}
        {rank: 2, name: 'verifying'}
        {rank: 3, name: 'releasing'}
    ]

    actions:
        newCard: -> false

`export default BoardController`