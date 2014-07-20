`import Ember from 'ember'`

NewProjectControlComponent = Ember.Component.extend
    newProjectError: false
    formOn: false

    focusInput: ->
        @$('.first-input').focus()

    actions:
        toggleFormOn: ->
            @set 'formOn', true
            Ember.run.scheduleOnce 'afterRender', @, @focusInput

        toggleFormOff: ->
            @set 'formOn', false

        createProject: ->
            @set 'newProjectError', false
            @set 'createFailedError', false

            name = @get 'newProjectName'
            description = @get 'newProjectDescription'

            if not name or not description
                @set 'newProjectError', true
            else
                newProject = @store.createRecord 'project', {name, description}
                newProject.save().then( =>
                    @set 'newProjectName', ''
                    @set 'newProjectDescription', ''
                    @set 'formOn', false
                ).catch =>
                    newProject.deleteRecord()
                    @set 'createFailedError', true

`export default NewProjectControlComponent`