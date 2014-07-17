NOT_AUTHORIZED = {error: "invalid credentials"}
MISSING_PARAM = {error: 'username and password required'}
NOT_UNIQUE = {error: 'username in use'}
CREATE_FAILED = (internal) ->
    error: "couldn't create user"
    internalError: internal

AuthController =
    login: (req, res) ->
        username = req.param 'username'
        password = req.param 'password'

        if not username or not password
            return res.json MISSING_PARAM, 400

        User.findOne {username}, (err, user) ->
            if not user
                res.json NOT_AUTHORIZED, 401
            else
                user.validatePassword(password).then (passwordMatch) ->
                    if passwordMatch
                        req.session.authenticated = true
                        req.session.user = user
                        res.json user, 200
                    else
                        res.json NOT_AUTHORIZED, 401

    status: (req, res) ->
        if req.session.user and req.session.authenticated
            res.json {user: req.session.user, authenticated: true}
        else
            res.json {authenticated: false}

    register: (req, res) ->
        username = req.param 'username'
        password = req.param 'password'

        User.findOne {username}, (err, user) ->
            if user
                res.send NOT_UNIQUE, 409
            else
                User.create({username, password}).done (err, user) ->
                    if err
                        res.json CREATE_FAILED(err), 500
                    else
                        req.session.authenticated = true
                        req.session.user = user
                        res.json user, 201

module.exports = AuthController