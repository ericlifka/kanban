CardController =
    _config: {}

    create: (req, res) ->
        card = req.param 'card'
        card.creator = req.session.username

        Card.create(card).done (error, card) ->
            if error
                res.json {error}, 500
            else
                res.json {card}, 201

    find: (req, res) ->
        id = req.param 'id'
        projectId = req.param 'projectId'
        username = req.session.username

        if id # find one
            Card.findOne(id).done (error, card) ->
                if error or not card
                    return res.send {error}, 404

                Project.findOne(card.projectId).done (error, project) ->
                    if error or not project or project.owner isnt username
                        res.forbidden "You don't have permission for that project"
                    else
                        res.json {card}

        else
            queryParams =
                creator: username
            queryParams.projectId = projectId if projectId

            Card.find(queryParams).done (error, cards) ->
                if error
                    res.send {error}, 500
                else
                    res.json {cards}

    update: (req, res) ->
        id = req.param 'id'
        cardUpdate = req.param 'card'

        Card.update id, cardUpdate, (error, card) ->
            if error
                res.send {error}, 500
            else
                res.send {card}

    destroy: (req, res) ->
        res.forbidden "Deleting cards is not supported at this time"

module.exports = CardController