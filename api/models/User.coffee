bcrypt = require 'bcrypt'
RSVP = require 'rsvp'

User =
    schema: true

    attributes:
        username:
            type: 'string'
            required: true

        password:
            type: 'string'
            required: true

        validatePassword: (password) -> new RSVP.Promise (resolve, reject) =>
            bcrypt.hash password, 10, (err, hash) =>
                if err then reject err
                else
                    resolve hash is @password

        toJSON: ->
            obj = @toObject()
            delete obj.password
            obj

    beforeCreate: (values, next) ->
        bcrypt.hash values.password, 10, (err, hash) ->
            if err then next(err)
            else
                values.password = hash
                next()

module.exports = User
