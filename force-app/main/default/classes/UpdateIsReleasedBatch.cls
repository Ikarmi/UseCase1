global class UpdateIsReleasedBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        String query = 'SELECT Id, Name,IsReleased__c,Release_date__c FROM Movie__c' ;
        return Database.getQueryLocator(query);
        
    }
    global void execute(Database.BatchableContext bc, List<Movie__c> moviesList){
        // process each batch of records
        List<Movie__c> moviesToUpdate = new List<Movie__c>();
        for(Movie__c mov : moviesList){
            if(mov.Release_date__c <= Date.Today()){
                mov.IsReleased__c = true;
                moviesToUpdate.add(mov);
            }
        }
        update moviesToUpdate;
        
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
}