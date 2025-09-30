public class ContactTriggerHandler {
    public static void test(){
         Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
        User usr = new User(alias = 'apexs', email='apex@ap4exhours.com', 
            emailencodingkey='UTF-8', lastname='Hours', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='apexho4urs@apexhours.com');
        insert usr;
        update New Contact (Id = '003gK000000xOb3QAE', LastName ='test');
    }
    
    public static void appendAccNameInCon(List<Contact> newList){
        system.debug('trigger.New::'+Trigger.New);
        system.debug('operation::'+Trigger.OperationType);
        Set<Id> accIdSet = New Set<Id>();
        For(Contact con : newList){
            if(con.AccountId != null){
                accIdSet.add(con.AccountId);
            }
        }
        if(!accIdSet.isEmpty()){
            Map<Id,Account> idVsAccMap = New Map<Id,Account>([select Id, Name from Account where Id IN:accIdSet]);
            For(Contact con : newList){
            	if(con.AccountId != null){
                    if(con.LastName.endsWith('- '+idVsAccMap.get(con.AccountId).Name)){
                        system.debug('if::');
                        return;
                    } else if(con.LastName.contains(' - ')){
                        system.debug('else if::');
                        con.LastName = (con.LastName.substring(0,con.LastName.indexOf('-')+1)).trim();
                        con.LastName = con.LastName + ' ' + idVsAccMap.get(con.AccountId).Name;
                    } else{
                        system.debug('else::');
                        con.LastName = (con.LastName + ' - ' + idVsAccMap.get(con.AccountId).Name).trim();
                    }
                    system.debug('exit::');
            	}
        	}
        } 
         Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
        User usr = new User(alias = 'apexs', email='apex@apexhours.com', 
            emailencodingkey='UTF-8', lastname='Hours', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='apexhours@apexhours.com');
        //insert usr;
        Update New User(Id=userinfo.getUserId(), Title = 'Mr.');
    }
    
    public static void appendAccNameInCon(Map<Id,Contact> newConMap, Map<Id,Contact> oldConMap){
        Set<Id> accIdSet = New Set<Id>();
        List<Account> accUpdatedList = New List<Account>();
        Boolean isAccountChanged = false;
        For(Contact con : newConMap.values()){
            if(Con.AccountId != null && oldConMap == null){
                accIdSet.add(con.AccountId);
            }  else if(oldConMap != null && oldConMap.get(con.Id).AccountId != null && oldConMap.get(con.Id).AccountId != con.Accountid){
                accIdSet.add(oldConMap.get(con.Id).AccountId);
            } else if (oldConMap != null && con.AccountId != null && oldConMap.get(con.Id).AccountId != con.Accountid){
                accIdSet.add(con.AccountId);
            }
        }
        if(!accIdSet.isEmpty()){
            Map<Id,Account> idVsAccountMap;
            for(Aggregateresult conAggr : [select count(Id) conCount , AccountId from Contact where AccountId IN : accIdSet group by AccountId]){
                Account acc = New Account(Id= (Id)conAggr.get('AccountId'),Contact_Count__c=(integer)conAggr.get('conCount') );
                accUpdatedList.add(acc);
            }
        }
        if(!accUpdatedList.isEmpty()){
            update accUpdatedList;
        }
        Update New User(Id=userinfo.getUserId(), Title = 'Mr.');
    }
}