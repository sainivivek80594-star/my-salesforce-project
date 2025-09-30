public class ChildClassOvverideVirtual extends parentClassVirtual {

   public override virtual void displayMessage() {
        System.debug('parent Class Message');
    }
    
    public void displayMessage2() {
        displayMessage1();
        System.debug('Base Class Message');
    }
    
    public void met(){
        system.debug(String.valueOf(this));
        system.debug(String.valueOf(this).substring(0,String.valueOf(this).indexOf(':')));
    }
}