`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
    modulePrefix: 'simply-kanban'
    Resolver: Resolver

loadInitializers App, 'simply-kanban'

`export default App`
