models = require("../../models/")

# ===================================
# Get the startup object
# ===================================
main = (req,res) ->
    res.render 'investors'
# ===================================
# Get the startup object
# ===================================
get = (req, res) ->
    if req.params.id
        return models.StartupModel.findById req.params.id, (err, item) ->
            if err
                return console.log err
            else
                return res.send item
    # Get the instalce of models.startupsmodels and fetch for result
    return models.StartupModel.find (err, items) ->
        if err
            return console.log err
        else
            return res.send items


# ======================================
# Post request to add a new startup object
# ======================================
post = (req, res) ->
    # Create a instance of object using data in body
    item = new models.StartupModel
                    title : req.body.title
                    description : req.body.description
    # Save the object into database
    item.save (err) ->
        if err
            return console.log err
        else
            return console.log 'created'

    # Return the saved object back on the screen
    res.send item

# ======================================
# Update only one startup object
# ======================================
put = (req, res) ->
    # if a new id id provided
    if not req.params.id
        return res.send 'error :: please provide a id'

    # if new id is provided then do something
    models.StartupModel.findById req.params.id, (err, item) ->
        if err
            console.log err
            return res.send('error happend')
        item.title = req.body.title
        item.description = req.body.description
        item.save (err) ->
            if err
                console.log err
            else
                console.log 'updated'
        return res.send item

# ======================================
# Update only one startup object
# ======================================
del = (req, res) ->
    if not req.params.id
        return res.send 'error :: please provide a id'
    # Models
    models.StartupModels.findById req.param.id, (err, item) ->
        if err
            console.log err
            return res.send 'Error Unhandled'

        # If no error 
        item.remove (err) ->
            if err
                console.log err
                return res.send 'Unable to remove'
            else
                return res.send 'removed'



exports.get = get
exports.post = post
exports.put = put
exports.del = del
