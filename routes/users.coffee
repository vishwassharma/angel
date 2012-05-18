# ===================================
# Get the startup object
# ===================================

main = (req, res) ->
    res.send "Users"

authenticate = (req, res, next) ->
    if req.loggedIn
        next()
    else
        res.redirect '/login'

exports.authenticate = authenticate
