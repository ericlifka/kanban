# Empty controller provided for automatic REST routes on the 'Project' model.
ProjectController =
    _config: {}

    create: (req, res) ->
        name = req.param 'name'
        description = req.param('description') or name
        owner = req.session.username

        Project.create({name, description, owner}).done (error, project) ->
            if error
                res.json {error}, 500
            else
                res.json project, 201

module.exports = ProjectController