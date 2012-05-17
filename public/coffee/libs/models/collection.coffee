define ['libs/subscriber'], (Subscriber) ->
    'use strict'

    class Collection extends Backbone.Collection

        # Mixin the default subscriber
        _.defaults Collection.prototype, Subscriber

        addAtomic : (models, options = {}) ->
            return unless models.length
            options.silent = true
            batch_direction = if typeof options.at is 'number' then 'pop' else 'shift'
            @add(model, options) while model = models[batch_direction]()
            @trigger 'reset'

        # Updates a collection with a list
        # Just like the reset method, but only adds new items and
        # removes items which are not in the new list
        #
        # options:
        #   deep: Boolean flag to specify whether existing models should be updated
        #         with new values
        update: (newList, options = {}) ->

            fingerPrint = @pluck('id').join()
            ids = _.pluck newList, 'id'
            newFingerPrint = ids.join()

            unless fingerPrint is newFingerPrint
                # Remove items which are not in the new list
                _ids = _(ids)

                i = @models.length - 1
                while i >=0
                    model = @models[i]
                    unless _ids.include model.id
                        @remove model
                    i--

            # Only add/update list if ID fingerprints differ or update
            # is deep (member attributes)
            unless fingerPrint is newFingerPrint and not options.deep
                # Add item which are not yet in the list
                for model, id in newList
                    preexist = @get model.id
                    if preexist
                        continue unless options.deep
                        preexist.set model
                    else:
                        @add model id :i



        # Disposed
        # ------------
        
        disposed : false

        dispose : ->
            return if @disposed

            @disposed = true



            # Frozing this
            Object.freeze? this

    Collection

