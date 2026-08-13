public with sharing class BeerArchiveBatch implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Status__c FROM Beer__c WHERE coder_Tags__c = \'Archive\' AND Status__c != \'Archive\''
        );
    }

    public void execute(Database.BatchableContext bc, List<Beer__c> scope) {
        for (Beer__c beer : scope) {
            beer.Status__c = 'Archive';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc) {
    }

}
