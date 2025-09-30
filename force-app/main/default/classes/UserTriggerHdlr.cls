public class UserTriggerHdlr {
    public static void reAssignOpp(Set<Id> usrIdSet){
        List<Opportunity> oppList = [SELECT Id, Name, OwnerId from Opportunity where OwnerId IN :usrIdSet ];
        For(Opportunity opp : oppList){
            opp.OwnerId = '005gK000001bWJjQAM';
        }
        Insert New Account(Name = 'Test Account');
        Update oppList;
    }
}