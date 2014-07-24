`import Ember from 'ember'`

ProjectBoardRoute = Ember.Route.extend
    afterModel: (project) ->
        @store.find('card', { project: project.get 'id' }).then (result) ->
            project.set 'cards', result.content or []

`export default ProjectBoardRoute`