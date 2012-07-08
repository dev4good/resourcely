mongoose = require 'mongoose'
mongooseAuth = require 'mongoose-auth'

UserSchema = new mongoose.Schema
  resources: [{ type: mongoose.Schema.ObjectId, ref: 'Resource' }]

UserSchema.plugin mongooseAuth,
  everymodule:
    everyauth:
      User: ->
        User

  password:
    loginWith: 'email'

    extraParams:
      name:
        first: String
        last: String
      email: String

    everyauth:
      getLoginPath: "/login"
      postLoginPath: "/login"
      getRegisterPath: "/register"
      postRegisterPath: "/register"
      loginSuccessRedirect: "/"
      registerSuccessRedirect: "/"

User = mongoose.model 'User', UserSchema
module.exports = User
