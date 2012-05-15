# Get home page
exports.index = (req, res) ->
    context =
        title : 'main page'
    res.render 'index', context
