`import DS from 'ember-data'`

Card = DS.Model.extend
    name: DS.attr()
    description: DS.attr()
    comments: DS.attr()

    column: DS.attr('number')
    rank: DS.attr('number')

    parent: DS.belongsTo 'card', { inverse: 'children', async: true }
    children: DS.hasMany 'card', { inverse: 'parent', async: true }
    columns: DS.attr()

    creator: DS.attr()
    projectId: DS.attr()

`export default Card`