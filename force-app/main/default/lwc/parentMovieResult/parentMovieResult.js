import { LightningElement,track,wire } from 'lwc';
import getAllMovies from '@salesforce/apex/MovieResultController.getMovies'
import ModalNewMovie from 'c/modalNewMovie';

export default class ParentMovieResult extends LightningElement {
    @track movies;
    @track showModal=false;
    @wire(getAllMovies)
    allMovies({data,error}){
        if(data){
            console.log('this is the data ===>'+ data);
            this.movies=data;
            console.log(this.movies[0].Name);
        }else{
            console.error('ERROOR');
        }
    }

    openModal() {
        this.showModal = true;
        console.log('WOOORKING');
        
    }
    closeModal() {
        this.showModal = false;
        console.log('Close Modal');
    }
}