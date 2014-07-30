`import Ember from 'ember'`

ColumnBottomDropzoneComponent = Ember.Component.extend
    classNameBindings: [':bottom-dropzone', 'active']
    active: false

    dragOver: (event) ->
        console.log("drag over well")
        event.preventDefault()
        @delegate.dragOverBottomWell @

`export default ColumnBottomDropzoneComponent`