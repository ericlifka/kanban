var AuthController = {
    login: function (req, res) {
        var user = req.param('user');
        if (user) {
            req.session.authenticated = true;
            req.session.user = user;

            res.json({user: user}, 200);
        } else {
            res.json({error: "user param is required"}, 401);
        }
    },

    status: function (req, res) {
        var user = req.session.user;
        if (user) {
            res.json({
                user: user,
                authenticated: true
            });
        } else {
            res.json({
                authenticated: false
            });
        }
    }
};

module.exports = AuthController;
