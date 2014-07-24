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

        column:
            type: 'int'
            required: true

        rank:
            type: 'int'

module.exports = Card