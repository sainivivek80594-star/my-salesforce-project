import { LightningElement } from 'lwc';
export default class AccountsListGrandParent extends LightningElement {
    childMessage = 'In Grand Parent';
    handleChild(event){
        console.log('fromchild::'+JSON.stringify(event));
        this.childMessage = event.detail; 
    }

}