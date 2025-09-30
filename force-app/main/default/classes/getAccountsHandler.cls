public without sharing class getAccountsHandler {
	@AuraEnabled
	public static integer LightningStudio(){
		return [select Id,name from Account USING SCOPE mine where id!=null].size();
	}
}