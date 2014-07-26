`import DS from 'ember-data'`

Project = DS.Model.extend
    name: DS.attr()
    description: DS.attr()
    owner: DS.attr()
    topCard: DS.attr()

    loadTopCard: Ember.observer 'topCard', ->
        topCardId = @get 'topCard'
        if topCardId
            @store.find('card', topCardId).then (card) =>
                @set 'top', card

`export default Project`
