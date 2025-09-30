import { LightningElement } from 'lwc';
export default class AccountListParent extends LightningElement {
    thisText = ''
    handleClick(event){
        console.log(JSON.stringify(event));
    }
    HandleChange(event){
        console.log('event:parent:::'+JSON.stringify(event));
        this.thisText = event.target.value;
    }
}