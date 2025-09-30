trigger AccountTrigger on Account (after update, after insert, before insert) {
    /*Account acc = trigger.new[0];
    system.debug('acc ::'+acc.Name);
    system.debug('acc ::'+acc.numberofEmployees );
    if(acc.Name != trigger.oldMap.get(acc.Id).Name){
        Account acc1 = New Account(Id = acc.Id);
        acc1.numberofEmployees =  acc.numberofEmployees+1;
        Update acc1;
    }*/
}