public with sharing class MovieResultController {
    
    @AuraEnabled(cacheable=true)
    public static List<Movie__c> getMovies(){
        return [SELECT id,Name,Image__c,Category__c,Release_date__c FROM Movie__c LIMIT 10];
    }
    @AuraEnabled
    public static Movie__c createMovie(String newRecord){
        MovieWrapper wr = (MovieWrapper) JSON.deserialize(newRecord, MovieWrapper.class);
        System.debug('movie received from JS ===> ' + wr);
        return null;
    }

    class MovieWrapper{
        @AuraEnabled public String Name;
        @AuraEnabled public String Description;
        @AuraEnabled public String Image;
        @AuraEnabled public String Category;
    }

}