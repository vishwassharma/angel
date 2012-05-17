(function() {
  var GuestListView,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/view', 'text!template/guests/guestList.html', 'models/guests', 'views/guests/guest', 'text!template/guests/addGuestForm.html'], function(View, template, GuestList, GuestView, formTemplate) {}, GuestListView = (function(_super) {

    __extends(GuestListView, _super);

    function GuestListView() {
      return GuestListView.__super__.constructor.apply(this, arguments);
    }

    GuestListView.prototype.el = '#page';

    GuestListView.prototype.guestcontainer = '#guests';

    GuestListView.prototype.collection = GuestList;

    GuestListView.prototype.template = _.template(template);

    GuestListView.prototype.formTemplate = _.template(formTemplate);

    GuestListView.prototype.events = {
      'click input#add-guest': 'addGuest'
    };

    GuestListView.prototype.initialize = function() {
      _.bindAll(this, 'render', 'addOne', 'addAll', 'addGuest', 'submitHandler');
      this.collection.bind('add', this.addOne);
      this.collection.bind('reset', this.addAll);
      return this.collection.fetch();
    };

    GuestListView.prototype.render = function() {
      this.$el.html(this.template);
      this.$(this.guestcontainer).sortable({
        revert: true
      });
      return this;
    };

    GuestListView.prototype.addOne = function(model) {
      var modelView;
      modelView = new GuestView({
        model: model
      });
      return this.$(this.guestcontainer).append(modelView.render().el);
    };

    GuestListView.prototype.addAll = function() {
      return this.collection.each(this.addOne);
    };

    GuestListView.prototype.activeform = false;

    GuestListView.prototype.addGuest = function(event) {
      event.preventDefault();
      if (this.activeform) {
        return;
      }
      this.$('input#add-guest').before(this.formTemplate);
      this.activeform = true;
      return this.$('form#form-guest').submit(this.submitHandler);
    };

    GuestListView.prototype.submitHandler = function(event) {
      var d, each, submitarray, _i, _len;
      event.preventDefault();
      submitarray = this.$('form#form-guest').serializeArray();
      d = {};
      for (_i = 0, _len = submitarray.length; _i < _len; _i++) {
        each = submitarray[_i];
        d[each['name']] = each['value'];
      }
      this.collection.create(d);
      this.$('form#form-guest').remove();
      this.activeform = false;
      return false;
    };

    return GuestListView;

  })(View), GuestListView);

}).call(this);
