import { LightningElement, track, api } from 'lwc';
import LightningStudio from '@salesforce/apex/getAccountsHandler.LightningStudio';
export default class AccountsList extends LightningElement {
    @track result = 0;
    @api parentText = '';
     @track year = '';
    @track errorMessage = '';
    connectedCallback(){
        LightningStudio()
        .then(result=>{
            console.log('reslt::'+result);
            this.result = result;
        })
        .catch(err=>{
            console.log('error::'+err);
        })
    }

    handleClick(event){
        //console.log(JSON.stringify(event));
        const selectEvent = new CustomEvent("fromchild", {
            composed : true,
            bubbles : true,
            detail : 'hii I\'m child Cmp.'
        });
         this.dispatchEvent(selectEvent);
         console.log('event dispatched');
    }
    
     handleInputChange(event) {
        let input = this.template.querySelector('lightning-input');
    let value = event.target.value;
    value = value.replace(/\D/g, '');
    if (value.length > 4) {
        value = value.slice(0, 4);
    }
    input.value = value; // Directly update the input's value
    }

}