define ['libs/models/collection', 'investors/model'], (Collection, Investor) ->

    class InvestorList extends Collection

        url : '/api/investors/'

        model : Investor
    
    investorList = new InvestorList

    investorList
