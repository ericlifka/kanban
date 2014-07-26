`import Ember from 'ember'`

Router = Ember.Router.extend
    location: SimplyKanbanENV.locationType

Router.map ->
    @route 'about'
    @route 'dashboard'
    @route 'account'

    @resource 'project', { path: '/project/:project_id' }, ->
        @route 'board'
        @route 'plan'

    @resource 'card', { path: '/card/:card_id' }, ->
        @route 'board'
        @route 'plan'

`export default Router`
