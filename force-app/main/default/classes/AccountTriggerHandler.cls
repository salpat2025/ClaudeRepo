public with sharing class AccountTriggerHandler {

    // ─── Before Insert ────────────────────────────────────────
    public void beforeInsert(List<Account> newAccounts) {
        for (Account acc : newAccounts) {
            // TODO: Add field defaulting / validation logic here
            // Example: enforce required fields, normalise phone format, etc.
        }
    }

    // ─── Before Update ────────────────────────────────────────
    public void beforeUpdate(List<Account> newAccounts, Map<Id, Account> oldMap) {
        for (Account acc : newAccounts) {
            Account old = oldMap.get(acc.Id);
            // TODO: Add field-change detection and pre-save logic here
            // Example: if (acc.Rating != old.Rating) { ... }
        }
    }

    // ─── After Insert ─────────────────────────────────────────
    public void afterInsert(List<Account> newAccounts, Map<Id, Account> newMap) {
        // TODO: Add post-insert logic here (DML on related records, platform events, etc.)
        // Example: create a default Contact, send a welcome task, fire a Flow
    }

    // ─── After Update ─────────────────────────────────────────
    public void afterUpdate(
        List<Account> newAccounts,
        Map<Id, Account> newMap,
        Map<Id, Account> oldMap
    ) {
        // TODO: Add post-update logic here
        // Example: cascade status changes to child Soft_Drink_Order__c records
        // Example: call an external system when BillingAddress changes
    }
}
