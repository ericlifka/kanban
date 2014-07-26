`import DS from 'ember-data'`

Card = DS.Model.extend
    name: DS.attr()
    creator: DS.attr()
    projectId: DS.attr()
    column: DS.attr()
    rank: DS.attr()
    parent: DS.attr()
    children: DS.attr()

    cards: null

`export default Card`