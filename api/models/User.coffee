bcrypt = require 'bcrypt'
RSVP = require 'rsvp'

User =
    schema: true

    attributes:
        username:
            type: 'string'
            required: true
            unique: true

        password:
            type: 'string'
            required: true

        validatePassword: (password) -> new RSVP.Promise (resolve, reject) =>
            bcrypt.compare password, @password, (err, result) ->
                if err
                    reject err
                else
                    resolve result

        changePassword: (password) -> new RSVP.Promise (resolve, reject) =>
            bcrypt.hash password, 10, (err, hash) =>
                if err
                    return reject err

                @password = hash
                @save (err) ->
                    if err
                        reject err
                    else
                        resolve true

        toJSON: ->
            obj = @toObject()
            delete obj.password
            obj

    beforeCreate: (values, next) ->
        bcrypt.hash values.password, 10, (err, hash) ->
            if err
                next err
            else
                values.password = hash
                next()

module.exports = User
