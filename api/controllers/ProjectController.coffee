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

    find: (req, res) ->
        id = req.param 'id'
        username = req.session.username

        if id # find one
            Project.findOne(id).done (err, project) ->
                if err or not project
                    res.send 404
                else if project.owner isnt username
                    res.json {error: "You don't have permission for that project"}, 403
                else
                    res.json project

        else # find all
            Project.find(
                owner: username
            ).sort('name ASC').done (error, projects) ->
                if error
                    res.send {error}, 500
                else
                    res.json projects

module.exports = ProjectController