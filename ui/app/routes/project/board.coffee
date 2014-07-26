`import Ember from 'ember'`

ProjectBoardRoute = Ember.Route.extend
    afterModel: (project) ->
        top = project.get 'top'
        @store.find('card', {parent: top.get 'id' }).then (result) ->
            top.set 'cards', result.content or []

    setupController: (controller, project) ->
        controller.set 'model', project.get 'top'

`export default ProjectBoardRoute`