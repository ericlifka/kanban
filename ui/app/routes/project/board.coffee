`import Ember from 'ember'`

ProjectBoardRoute = Ember.Route.extend
    afterModel: (project) ->
        #TODO load cards for project
        project.set 'cards', [
            Ember.Object.create id: 0, column: 0, rank: 0, name: 'first thing'
            Ember.Object.create id: 1, column: 2, rank: 0, name: 'second thing'
            Ember.Object.create id: 2, column: 3, rank: 0, name: 'third thing'
            Ember.Object.create id: 3, column: 0, rank: 1, name: 'fourth thing'
            Ember.Object.create id: 4, column: 1, rank: 0, name: 'fifth thing'
        ]

`export default ProjectBoardRoute`