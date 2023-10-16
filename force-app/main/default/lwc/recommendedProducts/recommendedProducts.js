import { LightningElement,track } from 'lwc';
import getParseProductJSON from '@salesforce/apex/JSON2Apex.parseProductJSON';

export default class RecommendedProducts extends LightningElement {
    
    @track  
    recommendedProducts = [];  
     
      connectedCallback(){
        console.log('Testing');
        getParseProductJSON()
        .then(result => {
            console.log(JSON.stringify(result)+'ProductData-->');
         this.recommendedProducts= result;
        })
        .catch(error => {
        });
        
      }
    }