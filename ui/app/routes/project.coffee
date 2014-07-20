`import Ember from 'ember'`

ProjectRoute = Ember.Route.extend
    setupController: (controller, model) ->
        @session.set 'lastProject', model
        controller.set 'model', model
        return

`export default ProjectRoute`