define [
    'views/view',
    'text!template/guests/guestList.html',
    'models/guests',
    'views/guests/guest',
    'text!template/guests/addGuestForm.html'],
    (View, template, GuestList, GuestView, formTemplate) ->
    # code ....
    class GuestListView extends View

        el : '#page'
        guestcontainer : '#guests'

        collection : GuestList

        template : _.template template
        formTemplate : _.template formTemplate

        events :
            'click input#add-guest' : 'addGuest'

        initialize: ->
            # Assign a model db with it
            _.bindAll @, 'render', 'addOne', 'addAll', 'addGuest', 'submitHandler'

            @collection.bind 'add', @addOne
            @collection.bind 'reset', @addAll

            @collection.fetch()
    
        render: ->
            # Load template into the view
            @$el.html @template
            @$(@guestcontainer).sortable
                    revert : true
            @

        addOne : (model) ->
            modelView = new GuestView model : model
            @$(@guestcontainer).append modelView.render().el

        addAll : ->
            @collection.each @addOne

        activeform : false

        addGuest: (event) ->
            # show add Guest form
            event.preventDefault()
            return if @activeform
            @$('input#add-guest').before @formTemplate
            @activeform = true
            @$('form#form-guest').submit @submitHandler
        
        submitHandler : (event) ->
            event.preventDefault()
            submitarray = @$('form#form-guest').serializeArray()
            d = {}
            for each in submitarray
                d[each['name']] = each['value']

            @collection.create d

            @$('form#form-guest').remove()

            @activeform = false

            false

    GuestListView
