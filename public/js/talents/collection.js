(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['libs/models/collection', 'talents/model'], function(Collection, Talent) {
    var TalentList, investorList;
    TalentList = (function(_super) {

      __extends(TalentList, _super);

      function TalentList() {
        return TalentList.__super__.constructor.apply(this, arguments);
      }

      TalentList.prototype.url = '/api/investors/';

      TalentList.prototype.model = Talent;

      return TalentList;

    })(Collection);
    investorList = new TalentList;
    return investorList;
  });

}).call(this);
