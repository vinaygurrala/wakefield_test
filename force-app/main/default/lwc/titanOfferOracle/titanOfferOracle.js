import { LightningElement, wire ,track} from 'lwc';
import getAvailableOffers from '@salesforce/apex/integerationToOracle.getResponse';

export default class TitanOfferOracle extends LightningElement {

@track    
offers =[];


connectedCallback(){
    console.log('Satyam');
    getAvailableOffers()
    .then(result => {
        console.log(result+'string geting printed');
     this.offers= result;
    })
    .catch(error => {
    });
}

}