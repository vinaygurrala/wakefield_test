import { LightningElement,track } from 'lwc';
import b2b_wakefieldProductImage from '@salesforce/resourceUrl/b2b_wakefieldProductImage';
export default class B2b_SingleStepCheckoutAddresses extends LightningElement {
    //to display the image in the product
    productImages = b2b_wakefieldProductImage;
    //condition on click of edit billing address button 
    @track displayChangeBillingAccount = false;
    //condition on click of edit delivery address button 
    @track displayChangeDeliveryAccount = false;
    //value for dropdown menu for edit button
     @track value = '';
     @track deliveryAccount = '';

     //to display input field on click of + icon
     @track displayInputField= false;
    //event on click of edit billing address button 
    handleClickEditBillingAccount(){
          this.displayChangeBillingAccount = true;
    }

 //event on click of edit delivery address button 
    handleClickEditDeliveryAccount(){
        this.displayChangeDeliveryAccount= true;

    }



    get options() {
        return [
            { label: 'Bestbuy Distributors LTD', value: 'Bestbuy Distributors LTD' },
            { label: 'Canadian Tire Partsource 761', value: 'Canadian Tire Partsource 761' },
            { label: 'Canadian Tire Partsource 765', value: 'Canadian Tire Partsource 765' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
          this.displayChangeBillingAccount = false;
    }

    //for delivery account
        get deliveryAccountOptions() {
        return [
            { label: 'Abby Tune-up centre ltd 200 Fuller Rd Ajax, Ontario L1S7W2 Canada', value: 'Abby Tune-up centre ltd 200 Fuller Rd Ajax, Ontario L1S7W2 Canada' },
              { label: 'Abby Tune-up centre ltd 400 Fuller Rd Ajax, Ontario L1S7G9 Canada', value: 'Abby Tune-up centre ltd 400 Fuller Rd Ajax, Ontario L1S7G9 Canada' },
              { label: 'Abby Tune-up centre ltd 600 Fuller Rd Ajax, Ontario L1S7V1 Canada', value: 'Abby Tune-up centre ltd 600 Fuller Rd Ajax, Ontario L1S7V1 Canada' },
        ];
    }

    handleChangeDeliveryAccount(event) {
        this.deliveryAccount = event.detail.value;
          this.displayChangeDeliveryAccount = false;
    }

    handleClickAddOrderNumber(){
             this.displayInputField = true;
    }

    handleClickSubmitButton(){
        this.displayInputField = false;
    }
}