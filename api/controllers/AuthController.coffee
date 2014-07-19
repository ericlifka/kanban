NOT_AUTHORIZED = {error: "invalid credentials"}
MISSING_PARAM = {error: 'username and password required'}
NOT_UNIQUE = {error: 'username in use'}
CREATE_FAILED = (internal) ->
    error: "couldn't create user"
    internalError: internal

AuthController =
    status: (req, res) ->
        {username, authenticated} = req.session

        if not authenticated or not username
            return res.json {authenticated: false}

        User.findOne {username}, (error, user) ->
            if error
                req.session.username = null
                req.session.authenticated = false
                res.json {authenticated: false}
            else
                res.json {user, authenticated}

    register: (req, res) ->
        username = req.param 'username'
        password = req.param 'password'

        if not username or not password
            return res.json MISSING_PARAM, 400

        User.create({username, password}).done (err, user) ->
            if err
                res.json CREATE_FAILED(err), 500
            else
                req.session.authenticated = true
                req.session.username = user.username
                res.json user, 201


    login: (req, res) ->
        username = req.param 'username'
        password = req.param 'password'

        if not username or not password
            return res.json MISSING_PARAM, 400

        User.findOne {username}, (err, user) ->
            if not user
                res.json NOT_AUTHORIZED, 401
            else
                promise = user.validatePassword password
                promise.then (passwordMatch) ->
                    if passwordMatch
                        req.session.authenticated = true
                        req.session.username = user.username
                        res.json user, 200
                    else
                        res.json NOT_AUTHORIZED, 401
                promise.catch (error) -> res.json {error}, 500

    logout: (req, res) ->
        req.session.authenticated = false
        req.session.username = null
        res.json {authenticated: false}

    changePassword: (req, res) ->
        username = req.param 'username'
        oldPassword = req.param 'oldPassword'
        newPassword = req.param 'newPassword'
        sessionUser = req.session.username

        if sessionUser isnt username
            return res.json NOT_AUTHORIZED, 401

        User.findOne {username}, (err, user) ->
            if err or not user
                return res.json NOT_AUTHORIZED, 401

            user.validatePassword(oldPassword).then((passwordMatch) ->
                if not passwordMatch
                    false
                else
                    user.changePassword newPassword

            ).then((success) ->
                if success
                    res.send 200
                else
                    res.json NOT_AUTHORIZED, 401

            ).catch (error) ->
                res.json {error}, 500

module.exports = AuthController