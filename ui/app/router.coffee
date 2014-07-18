`import Ember from 'ember'`

Router = Ember.Router.extend
    location: SimplyKanbanENV.locationType

Router.map ->
    @route 'about'

`export default Router`
