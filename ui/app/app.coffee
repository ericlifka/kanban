`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

Ember.MODEL_FACTORY_INJECTIONS = true

SimplyKanban = Ember.Application.extend
    modulePrefix: 'simply-kanban'
    Resolver: Resolver
    lastPage: '#'
    currentPage: '#'

loadInitializers SimplyKanban, 'simply-kanban'

`export default SimplyKanban`
