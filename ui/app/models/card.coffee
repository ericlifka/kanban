`import DS from 'ember-data'`

Card = DS.Model.extend
    name: DS.attr()
    description: DS.attr()
    comments: DS.attr()

    column: DS.attr()
    rank: DS.attr()

    parent: DS.belongsTo 'card', { async: true }
    children: DS.hasMany 'card', { async: true }
    columns: DS.attr()

    creator: DS.attr()
    projectId: DS.attr()

    cards: null

`export default Card`