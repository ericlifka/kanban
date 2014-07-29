Card =
    attributes:
        name: { type: 'string', required: true }
        description: { type: 'string' }
        comments: { type: 'array', defaultsTo: [] }

        column: { type: 'int' }
        rank: { type: 'int' }

        parent: { type: 'int' }
        children: { type: 'array', defaultsTo: [] }
        columns:
            type: 'array'
            defaultsTo: [
                { name: 'preparing' }
                { name: 'doing' }
                { name: 'verifying' }
                { name: 'releasing' }
            ]

        creator: { type: 'string', required: true }
        projectId: { type: 'int', required: true }

module.exports = Card