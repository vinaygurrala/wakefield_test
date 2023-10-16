import { LightningElement, track} from 'lwc';
import getRecommendedProducts from '@salesforce/apex/integerationToOracle.getResponse';

export default class TitanRecommendedProduct extends LightningElement {

 @track  
recommendedProducts = [];


  connectedCallback(){
    console.log('Satyam');
    getRecommendedProducts()
    .then(result => {
        console.log(JSON.stringify(result)+'string geting printed');
     this.recommendedProducts= result;
    })
    .catch(error => {
    });
    
  }
   

}