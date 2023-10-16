import { LightningElement, track } from 'lwc';

import createContact from '@salesforce/apex/ContactController.createContact';

export default class NewRegistrationLWC extends LightningElement {

    firstName;
    lastName;
    email;

    handlefirstName(event){
        const {name, value} = event.target;
        this[name] = value;
        console.log(event.target.value);
            this.firstName = event.target.value;
    }
    handleLastName(event){
        const {name, value} = event.target;
        this[name] = value;
        console.log(event.target.value);
            this.lastName = event.target.value;
    }
    handleEmail(event){
        const {name, value} = event.target;
        this[name] = value;
        console.log(event.target.value);
            this.email = event.target.value;
    }

    saveContactDetails(){
        console.log(this.firstName + this.lastName + this.email);
        createContact({firstName : this.firstName, lastName : this.lastName, email : this.email})
         .then(result => { 
            console.log('name ' + result.FirstName);
            console.log('name ' + result.LastName);
            console.log('Account ' + result.AccountId);
            console.log('email ' + result.Email);
        }).catch(error => console.log('error ',error));
    }
    


}