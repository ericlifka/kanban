`import DS from 'ember-data'`

Project = DS.Model.extend
    name: DS.attr()
    description: DS.attr()
    owner: DS.attr()
    topCard: DS.attr()

    top: null

`export default Project`
