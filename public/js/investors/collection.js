(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['libs/models/collection', 'investors/model'], function(Collection, Investor) {
    var InvestorList, investorList;
    InvestorList = (function(_super) {

      __extends(InvestorList, _super);

      function InvestorList() {
        return InvestorList.__super__.constructor.apply(this, arguments);
      }

      InvestorList.prototype.url = '/api/investors/';

      InvestorList.prototype.model = Investor;

      return InvestorList;

    })(Collection);
    investorList = new InvestorList;
    return investorList;
  });

}).call(this);
