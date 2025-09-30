public class NavigationApexClass {
  @InvocableMethod(label='Get Account Names')
  public static List<String> getName(List<String> pageName) {
      system.debug('pageName::'+pageName);
      List<String> returnList = New List<String>();
      if(pageName != null && !pageName.isEmpty()){
          if(pageName[0].contains('Sales Console')){
              returnList.add('https://orgfarm-2f7ea98ea2-dev-ed.develop.lightning.force.com/lightning/o/Account/list?filterName=__Recent');
              return returnList;
          } else if(pageName[0].contains('Sales')) {
              returnList.add('https://orgfarm-2f7ea98ea2-dev-ed.develop.lightning.force.com/lightning/o/Contact/pipelineInspection?filterName=00BgK000006JbhxUAC');
              return returnList;        
          } else {
              returnList.add('https://orgfarm-2f7ea98ea2-dev-ed.develop.lightning.force.com/lightning/o/Contact/pipelineInspection?filterName=00BgK000006JbhxUAC');
              return returnList;
          }
      }
      return returnList;
}
}