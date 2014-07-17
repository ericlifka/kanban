`import Ember from 'ember'`

Router = Ember.Router.extend
    location: SimplyKanbanENV.locationType

Router.map ->
    @route 'login'
    @route 'register'

`export default Router`
