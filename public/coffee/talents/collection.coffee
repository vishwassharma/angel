define ['libs/models/collection', 'talents/model'], (Collection, Talent) ->

    class TalentList extends Collection

        url : '/api/investors/'

        model : Talent
    
    investorList = new TalentList

    investorList
