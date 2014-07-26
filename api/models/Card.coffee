Card =
    attributes:
        name:
            type: 'string'
            required: true

        creator:
            type: 'string'
            required: true

        projectId:
            type: 'int'
            required: true

        parent:
            type: 'int'

        column:
            type: 'int'

        rank:
            type: 'int'

        children:
            type: 'array'
            defaultsTo: []


module.exports = Card