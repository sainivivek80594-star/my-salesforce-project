public class LeadTriggerHandler extends TriggerHandler {
    
    List<Lead> newLeads;
    
    public override void beforeInsert() {
        system.debug('leadTriggerHandler : beforeInsert');
        System.debug('beforeInsert Leadnew'+ Trigger.new);
        				
    }
    public override void beforeUpdate() {
		System.debug('before Update Leadnew'+ Trigger.new);
    }
    public override void beforeDelete() {
        				
    }
    public override void afterInsert() {
        system.debug('leadTriggerHandler afterinsert running');
        System.debug('afterInsert Leadnew'+ Trigger.new);
       

        Account x = new Account(name='gopi');
        insert x;
        system.debug('account'+x);      
        				
    }
    public override void afterUpdate() {
        				
    }
    public override void afterDelete() {
        				
    }
    public override void afterUndelete() {
        				
    }

}