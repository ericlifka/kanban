`import Ember from 'ember'`

CardRoute = Ember.Route.extend
    afterModel: (card) ->
        @session.changeLastCard card
        @store.find('card', { parent: card.get 'id' }).then (result) ->
            card.set 'cards', result.content

`export default CardRoute`