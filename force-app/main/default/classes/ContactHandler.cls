public class ContactHandler {
    public static void updateAccountContactCount(List<Contact> contacts) {
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
        
        for (Contact contact : contacts) {
            if (contact.AccountId != null) {
                if (!accountsToUpdate.containsKey(contact.AccountId)) {
                    accountsToUpdate.put(contact.AccountId, new Account(Id = contact.AccountId));
                }
                else 
                 Account account = accountsToUpdate.get(contact.AccountId);
                //account.Contact_Count__c += 1;
            }
        }
        
        if (!accountsToUpdate.isEmpty()) {
            //update accountsToUpdate.values();
        }
    }
}