Card =
    attributes:
        name:
            type: 'string'
            required: true

        creator:
            type: 'string'
            required: true

        projectId:
            type: 'string'
            required: true

        parent:
            type: 'string'

        column:
            type: 'int'

        rank:
            type: 'int'

module.exports = Card