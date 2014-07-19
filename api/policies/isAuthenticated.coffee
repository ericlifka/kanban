#/**
# * isAuthenticated
# *
# * @module      :: Policy
# * @description :: Simple policy to allow any authenticated user
# *                 Assumes that your login action in one of your controllers sets `req.session.authenticated = true;`
# * @docs        :: http://sailsjs.org/#!documentation/policies
# *
# */
isAuthenticated = (req, res, next) ->
    if not req.session.authenticated
        res.forbidden "You are not authenticated"
    else
        next()

module.exports = isAuthenticated