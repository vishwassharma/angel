(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['libs/subscriber'], function(Subscriber) {
    'use strict';

    var Collection;
    Collection = (function(_super) {

      __extends(Collection, _super);

      function Collection() {
        return Collection.__super__.constructor.apply(this, arguments);
      }

      _.defaults(Collection.prototype, Subscriber);

      Collection.prototype.addAtomic = function(models, options) {
        var batch_direction, model;
        if (options == null) {
          options = {};
        }
        if (!models.length) {
          return;
        }
        options.silent = true;
        batch_direction = typeof options.at === 'number' ? 'pop' : 'shift';
        while (model = models[batch_direction]()) {
          this.add(model, options);
        }
        return this.trigger('reset');
      };

      Collection.prototype.update = function(newList, options) {
        var fingerPrint, i, id, ids, model, newFingerPrint, preexist, _i, _ids, _len, _results;
        if (options == null) {
          options = {};
        }
        fingerPrint = this.pluck('id').join();
        ids = _.pluck(newList, 'id');
        newFingerPrint = ids.join();
        if (fingerPrint !== newFingerPrint) {
          _ids = _(ids);
          i = this.models.length - 1;
          while (i >= 0) {
            model = this.models[i];
            if (!_ids.include(model.id)) {
              this.remove(model);
            }
            i--;
          }
        }
        if (!(fingerPrint === newFingerPrint && !options.deep)) {
          _results = [];
          for (id = _i = 0, _len = newList.length; _i < _len; id = ++_i) {
            model = newList[id];
            preexist = this.get(model.id);
            if (preexist) {
              if (!options.deep) {
                continue;
              }
              preexist.set(model);
            }
            _results.push({
              "else": this.add(model({
                id: i
              }))
            });
          }
          return _results;
        }
      };

      Collection.prototype.disposed = false;

      Collection.prototype.dispose = function() {
        if (this.disposed) {
          return;
        }
        this.disposed = true;
        return typeof Object.freeze === "function" ? Object.freeze(this) : void 0;
      };

      return Collection;

    })(Backbone.Collection);
    return Collection;
  });

}).call(this);
