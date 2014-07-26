`import Ember from 'ember'`

ProjectRoute = Ember.Route.extend
    afterModel: (project) ->
        if not project.get 'top'
            @store.find('card', project.get 'topCard').then (card) ->
                project.set 'top', card
                project

`export default ProjectRoute`