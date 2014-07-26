`import DS from 'ember-data'`

Card = DS.Model.extend
    name: DS.attr()

    column: DS.attr()
    rank: DS.attr()

    parent: DS.attr()
    children: DS.attr()
    columns: DS.attr()

    creator: DS.attr()
    projectId: DS.attr()

    cards: null

`export default Card`