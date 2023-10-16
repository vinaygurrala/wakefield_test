import { LightningElement, track } from 'lwc';
//import LOGIN_LOGO from '@salesforce/resourceUrl/Login_Logo';
import { NavigationMixin } from 'lightning/navigation';
import doLogin from '@salesforce/apex/C_LoginController.UserLogin';
//import sendEmail from '@salesforce/apex/C_SendAndVerifySms.sendEmail';
//import sendSms from '@salesforce/apex/C_SendAndVerifySms.sendSms';

//import Password from '@salesforce/label/c.EM_Password';
//import Username from '@salesforce/label/c.EM_Username';
//import CreateNewAccount from '@salesforce/label/c.EM_Create_New_Account';
//import ForgotPassword from '@salesforce/label/c.EM_Forgot_Password';
//import Or from '@salesforce/label/c.EM_Or';
//import SignIn from '@salesforce/label/c.EM_SignIn';
//import PhoneNumber from '@salesforce/label/c.EM_Phone_Number';

//import InputPassword from '@salesforce/label/c.EM_Input_Password';
//import InputUsername from '@salesforce/label/c.EM_Input_Username';
//import Invalidmobilenumber from '@salesforce/label/c.EM_Invalid_Mobile_Number';
//import InvalidLogin from '@salesforce/label/c.EM_Invalid_Login';
//import InputNumber from '@salesforce/label/c.EM_Enter_Phone_Number';


export default class emLogIn extends NavigationMixin(LightningElement) {
    //logo = LOGIN_LOGO + '/Login_Logo.png';

    /*label = {
        Username,
        Password,
        CreateNewAccount,
        ForgotPassword,
        Or,
        SignIn,
        InputPassword,
        Invalidmobilenumber,
        InputUsername,
        PhoneNumber,
        InvalidLogin,
        InputNumber

    };*/

    @track password = null;
    @track phone = null;
    @track mobileNumberError = null;
    @track loginError = null;
    @track phoneValid;
    @track phoneValue = null;
    @track requiredTooltipDisplayData = {};
    @track errorTooltipDisplayData = {};


    connectedCallback(){
        this.requiredTooltipDisplayData.password = 'tooltiptext tooltipHide';
        this.requiredTooltipDisplayData.phone = 'tooltiptext tooltipHide';

        this.errorTooltipDisplayData.phone = 'tooltiptext tooltipHide';

    };

    handleUsernameChange(event){

        this.phone = event.target.value;
        this.phoneValue = this.phone;
    }

    handlePasswordChange(event){

        this.password = event.target.value;
    }



    handleSignIn(event){
        //this.errorTooltipDisplayData.password = 'tooltiptext tooltipHide';
        //this.errorTooltipDisplayData.phone = 'tooltiptext tooltipHide';

        //if(!this.phone){

        //    this.requiredTooltipDisplayData.phone = 'tooltiptext tooltipShow tooltipError';

        /*} else {

            this.requiredTooltipDisplayData.phone = 'tooltiptext tooltipHide';
            //let phoneCheck = /^\+62?([0-9]{10,13})$/.test(this.phone);
            console.log('phoneCheck phone-- ', this.phone);
            //this.phone = this.phoneValue;
            //let phoneCheck = /^[8]([0-9]{8,11})$/.test(this.phone); //phone number should be 9-12 digits starting from 8
            //console.log('phoneCheck-- ', phoneCheck);
            //this.phoneValid = phoneCheck;

            var str = this.phone
            var strPhone = str.substring(0,1); //check the mobile number if starts with 8
            var strPhoneAreaCode = str.substring(0,3); //check the mobile number if starts with +62

            //if(strPhoneAreaCode == '+62' || strPhone != '8' || ( phoneCheck == null || phoneCheck == undefined || phoneCheck == false )){
            //    console.log('err-- ');
            //    this.loginError = this.label.InvalidLogin;
            //    this.errorTooltipDisplayData.password = 'tooltiptext tooltipShow tooltipError';
            //}
        }

        if(!this.password){

            this.requiredTooltipDisplayData.password = 'tooltiptext tooltipShow tooltipError';

        } else {

            this.requiredTooltipDisplayData.password = 'tooltiptext tooltipHide';
        }
        */

        this.userLogin();

    };

    async userLogin(){
        if(this.phone  && this.password){
            console.log('login before phone-- ', this.phone);
            console.log('login phoneValid-- ', this.phoneValid);

            //test method for init self registration. to be removed
            //sendEmail().then((result)=> {console.log('Id created from send email : initSelfRegistration : ',result);})
                      // .catch((error)=>{console.log('Exception : initSelfRegistration : send email ',error)});
            //sendSms().then((result)=> {console.log('Id created from send sms : initSelfRegistration : ',result);})
                       //.catch((error)=>{console.log('Exception : initSelfRegistration : send sms ',error)});

            if(true){
                //this.phone = '+62' + this.phone;
                console.log('login after phone-- ', this.phone);
                doLogin({ phone: this.phone, password: this.password })
                    .then((result) => {
                        console.log('Login');
                        console.log(result);
                        window.location.href = result;
                    })
                    .catch((error) => {
                        this.error = error;
                        this.errorCheck = true;
                        this.errorMessage = error.body.message;
                        console.log('--error ' , this.errorMessage);
                        this.loginError = this.label.InvalidLogin;
                        this.errorTooltipDisplayData.password = 'tooltiptext tooltipShow tooltipError';
                    });
                }
            }

    }


    handleCreateAccount(event){
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: '/SampleCB2/s/signup/persona-selection'
            }
        })
    };

    handleForgotPW() {
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: '/SampleCB2/s/custom-login/forgot-password-phone-number'
            }
        })
    }

}