`import Ember from 'ember'`

ColumnBottomDropzoneComponent = Ember.Component.extend
    classNameBindings: [':bottom-dropzone', 'active']
    active: false

    dragOver: (event) ->
        event.preventDefault()
        @delegate.dragOverBottomWell @

    drop: (event) ->
        @delegate.dropOnWell @

`export default ColumnBottomDropzoneComponent`