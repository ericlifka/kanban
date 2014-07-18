`import SessionService from '../services/session'`

SessionInitializer =
    name: 'session'
    initialize: (container, app) ->
        app.register 'service:session', SessionService, {singleton: true, initialize: true}
        app.inject 'route', 'session', 'service:session'
        app.inject 'controller', 'session', 'service:session'
        app.inject 'component', 'session', 'service:session'

`export default SessionInitializer`