trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
if((Trigger.IsInsert || Trigger.IsUpdate) && Trigger.isBefore){
        ContactTriggerHandler.appendAccNameInCon(Trigger.new);
	//new LeadTriggerHandler().run();
    }
}