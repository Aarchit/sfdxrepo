global class Batch_AddConToAcc implements Database.Batchable <sObject> {
    // new list of contact object
    List<contact> lstCon = new List<Contact>();
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, Name FROM Account WHERE Id NOT IN(SELECT AccountId FROM Contact)';
        return Database.getQueryLocator(query);
    }
    // we are calling execute methd in the batch class
    global void execute(Database.BatchableContext bc,List<Account> batch) {
        for (Account a : batch) {
            Contact c =  new Contact();
            c.LastName = a.Name;
            c.AccountId = a.Id;
            lstCon.add(c);
        }
        INSERT lstCon;
    }
    
    global void finish(Database.BatchableContext bc) {
        //Do Nothing.
    }
}