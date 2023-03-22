import { LightningElement,track,api,wire } from 'lwc';
import saveMovie from '@salesforce/apex/MovieResultController.createMovie';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import CATEGORY_FIELD from '@salesforce/schema/Movie__c.Category__c';
import MOVIE_OBJECT from '@salesforce/schema/Movie__c';

export default class ModalNewMovie extends LightningElement {
    @api showModal;
    @track selectedValue;
    @track name;
    @track description;
    @track image;
    @track recordId;

// Category Picklist
    @track myOptions = [];

    @wire(getObjectInfo, { objectApiName: MOVIE_OBJECT })
    movieMetadata;

    @wire(getPicklistValues, {
        recordTypeId : '$movieMetadata.data.defaultRecordTypeId',
        fieldApiName : CATEGORY_FIELD })
    getCategoryPicklist({data,error}){
        if(data){
            this.myOptions = data.values;
        }
    }
    // close the modal               
    closeModal(){
        this.dispatchEvent(new CustomEvent('closemodal'));
    }
    // The handlers
    handleValueChange(event) {
        this.selectedValue = event.detail.value;
    }
    handleNameChange(event){
        this.name=event.target.value;
    }
    handleDescriptionChange(event){
        this.description=event.target.value;
    }
    handleImageChange(event){
        this.image=event.target.value;
    }
    handleSubmit(event){

        let movieObject = {};
        movieObject.Name = this.name;
        movieObject.Description = this.description;
        movieObject.Image = this.image;
        movieObject.Category = this.selectedValue;
        console.log('this is the object :'+ JSON.stringify(movieObject));

        saveMovie({newRecord: JSON.stringify(movieObject)})
            .then(result => {
                this.recordId = result;
            })
            .catch(error => {
                this.error = error;
        });
    
    }
    
}
