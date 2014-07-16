import Ember from 'ember';

var IndexRoute = Ember.Route.extend({
    model: function () {
        return ['red', 'blue', 'yellow'];
    }
});

export default IndexRoute;
