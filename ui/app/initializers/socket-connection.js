export default {
	name: 'socket-connection',

	initialize: function(container, app) {
		app.deferReadiness();

		console.log("socket - Establishing connection");
		var socket = window.io.connect();
		socket.on('connect', function socketConnected() {
			socket.on('message', function messageReceived(message) {
				console.log("New comet message received :: ", message);
			});
			console.log("socket - Connection established");

			app.advanceReadiness();
		});

		app.set('socket', socket);
	}
};
