/**
 * User
 *
 * @module      :: Model
 * @description :: A short summary of how this model works and what it represents.
 * @docs		:: http://sailsjs.org/#!documentation/models
 */

var User = {
	schema: true,

	attributes: {
		username: {
			type: 'string', 
			unique: true
		},
		email: {
			type: 'email',
			unique: true
		},
		passports: {
			collection: 'Passport', 
			via: 'user'
		}
	}
};

module.exports = User;
