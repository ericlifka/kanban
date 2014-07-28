`import Ember from 'ember'`
`import DS from 'ember-data'`

Project = DS.Model.extend
    name: DS.attr()
    description: DS.attr()
    owner: DS.attr()
    topCard: DS.attr()

    top: null

    kanbanHref: Ember.computed 'topCard', ->
        "#/card/#{@get('topCard')}/board"

`export default Project`
