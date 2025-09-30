Trigger UserTrigger On User(after update){
	Set<Id> userIdSet = New Set<Id>();
	For(User usr : trigger.New){
		//if(usr.IsActive && trigger.oldMap.get(usr.Id).IsActive == False){
			userIdSet.add(usr.Id);
		//}
	}
    if(!userIdSet.isEmpty()){
        UserTriggerHdlr.reAssignOpp(userIdSet);
    }
}