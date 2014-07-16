`import SessionService from '../services/session'`

SessionInitializer =
    name: 'session'
    initialize: (container, app) ->
        app.register 'service:session', SessionService, {singleton: true, initialize: true}
        app.inject 'route', 'session', 'service:session'

`export default SessionInitializer`