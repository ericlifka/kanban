import Ember from 'ember';

var ApplicationRoute = Ember.Route.extend({
    beforeModel: function () {
        console.log('application route beforeModel hook');
    }
});

export default ApplicationRoute;
