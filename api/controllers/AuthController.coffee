AuthController =
    login: (req, res) ->
        user = req.param 'user'
        if user
            req.session.authenticated = true
            req.session.user = user

            res.json {user}

        else
            error = "user param is required"

            res.json {error}, 401

    status: (req, res) ->
        user = req.session.user
        authenticated = if user then true else false

        res.json {user, authenticated}

module.exports = AuthController
