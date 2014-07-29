`import Ember from 'ember'`

CardRoute = Ember.Route.extend
    afterModel: (card) ->
        @session.changeLastCard card

`export default CardRoute`