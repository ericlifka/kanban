`import Ember from 'ember'`

ProjectRoute = Ember.Route.extend
    setupController: (controller, model) ->
        @session.changeProject model
        controller.set 'model', model
        return

`export default ProjectRoute`