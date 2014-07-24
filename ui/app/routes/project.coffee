`import Ember from 'ember'`

ProjectRoute = Ember.Route.extend
    afterModel: (project) ->
        @session.changeProject project

`export default ProjectRoute`