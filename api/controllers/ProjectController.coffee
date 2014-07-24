ProjectController =
    _config: {}

    create: (req, res) ->
        project = req.param 'project'
        project.owner = req.session.username

        Project.create(project).done (error, project) ->
            if error
                res.json {error}, 500
            else
                res.json {project}, 201

    find: (req, res) ->
        id = req.param 'id'
        username = req.session.username

        if id # find one
            Project.findOne(id).done (error, project) ->
                if error or not project
                    res.send {error}, 404
                else if project.owner isnt username
                    res.forbidden "You don't have permission for that project"
                else
                    res.json {project}

        else # find all
            Project.find(
                owner: username
            ).sort('name ASC').done (error, projects) ->
                if error
                    res.send {error}, 500
                else
                    res.json {projects}

    update: (req, res) ->
        id = req.param 'id'
        projectUpdate = req.param 'project'

        Project.update id, projectUpdate, (error, project) ->
            if error
                res.send {error}, 500
            else
                res.send {project}

    destroy: (req, res) ->
        res.forbidden "Deleting projects is not supported at this time"

module.exports = ProjectController