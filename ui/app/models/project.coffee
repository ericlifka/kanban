`import DS from 'ember-data'`

Project = DS.Model.extend
    name: DS.attr()
    description: DS.attr()
    owner: DS.attr()


`export default Project`
