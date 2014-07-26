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
    pid = req.param 'project'
    parent = req.param 'parent'

    queryParams =
        creator: sessionUser
    queryParams.projectId = pid if pid
    queryParams.parent = parent if parent

    console.log queryParams
    Card.find(queryParams).done (error, cards) ->
        if error
            res.send {error}, 500
        else
            res.json {cards}

fakeRecord =
    fake: true
    children: []
    save: (cb) -> cb null

fakeLoad =
    done: (cb) ->
        cb null, fakeRecord

loadParent = (parentId) ->
    if parentId
        Card.findOne parentId
    else
        fakeLoad

CardController =
    _config: {}

    create: (req, res) ->
        card = req.param 'card'
        card.creator = req.session.username

        loadParent(card.parent).done (error, parent) ->
            if error then return res.json {error}, 500
            Card.create(card).done (error, card) ->
                if error then return res.json {error}, 500
                parent.children.push card
                card.columns = parent.columns if parent.columns
                card.save (error) ->
                    if error then return res.json {error}, 500
                    parent.save (error) ->
                        if error then return res.json {error}, 500
                        if parent.fake
                            res.json {card}, 201
                        else
                            res.json { cards: [ card, parent ] }, 201

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