SocketConnectionInitializer =
    name: 'socket-connection'
    initialize: (container, app) ->
        app.deferReadiness()
        console.log 'socket- Establishing connection'

        socket = window.io.connect()
        app.set 'socket', socket

        socket.on 'connect', ->
            socket.on 'message', (message) -> console.log "socket - new comet message received :: #{message}"

            console.log "socket - connection established"
            app.advanceReadiness()

        return

`export default SocketConnectionInitializer`