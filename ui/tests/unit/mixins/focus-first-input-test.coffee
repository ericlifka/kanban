`import Ember from 'ember'`
`import FocusFirstInputMixin from 'simply-kanban/mixins/focus-first-input'`

module 'FocusFirstInputMixin'

# Replace this with your real tests.
test 'it works', ->
  FocusFirstInputObject = Ember.Object.extend FocusFirstInputMixin
  subject = FocusFirstInputObject.create()
  ok subject
