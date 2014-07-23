`import Ember from 'ember'`

ProjectBoardRoute = Ember.Route.extend
    afterModel: (project) ->
        #TODO load cards for project
        project.set 'cards', [
            {id: 0, column: 0, rank: 0, name: 'first thing'}
            {id: 1, column: 2, rank: 0, name: 'second thing'}
            {id: 2, column: 3, rank: 0, name: 'third thing'}
            {id: 3, column: 0, rank: 1, name: 'fourth thing'}
            {id: 4, column: 1, rank: 0, name: 'fifth thing'}
        ]

`export default ProjectBoardRoute`