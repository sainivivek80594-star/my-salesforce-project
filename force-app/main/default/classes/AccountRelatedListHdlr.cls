/**
* @File Name : AccountRelatedListHdlr.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : September 28, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | September 28, 2025 |   | Initial Version
**/

public with sharing class AccountRelatedListHdlr {
	@AuraEnabled(cacheable=true)
	public static List<Account> getAccountsList(){
		return [SELECT Id, Name FROM Account LIMIT 50000];
	}
}