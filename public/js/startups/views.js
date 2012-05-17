(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['libs/views/view', 'text!templates/startups/index.html'], function(View, template) {
    var StartupView;
    StartupView = (function(_super) {

      __extends(StartupView, _super);

      function StartupView() {
        return StartupView.__super__.constructor.apply(this, arguments);
      }

      StartupView.prototype.template = _.template(template);

      StartupView.prototype.tagName = 'li';

      StartupView.prototype.className = 'ui-state-default';

      StartupView.prototype.id = 'guestItem';

      StartupView.prototype.initialize = function() {
        console.log("Initialize");
        return _.bindAll(this, 'render');
      };

      StartupView.prototype.render = function() {
        this.$el.html(this.template);
        console.log(this.$el);
        return this;
      };

      return StartupView;

    })(View);
    return StartupView;
  });

}).call(this);
