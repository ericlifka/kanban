findCardById = (req, res) ->
    id = req.param 'id'
    sessionUser = req.session.username

    Card.findOne(id).done (error, card) ->
        if error or not card
            return res.send {error}, 404

        Project.findOne(card.projectId).done (error, project) ->
            if error or not project or project.owner isnt sessionUser
                res.forbidden "You don't have permission for that project"
            else
                res.json {card}

queryForCards = (req, res) ->
    sessionUser = req.session.username
    pid = req.param 'projectId'

    queryParams =
        creator: sessionUser
    queryParams.projectId = pid if pid

    Card.find(queryParams).done (error, cards) ->
        if error
            res.send {error}, 500
        else
            res.json {cards}


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
        if req.param 'id' # find one
            findCardById req, res
        else # find many
            queryForCards req, res

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