`import Ember from 'ember'`

Router = Ember.Router.extend
    location: SimplyKanbanENV.locationType

Router.map ->
    @route 'about'
    @route 'dashboard'

`export default Router`
