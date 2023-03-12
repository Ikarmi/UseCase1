global class UpdateIsReleasedSchedule implements Schedulable {
    
    public static final String CRON_EXPRESSION = '0 00 00 * * ?';  //Every Day at Midnight
    
    global void execute(SchedulableContext SC) {
        UpdateIsReleasedBatch se = new UpdateIsReleasedBatch();
        Database.executeBatch(se,100);
   	}
    
    global static String scheduleBatch(){
       UpdateIsReleasedSchedule sc = new UpdateIsReleasedSchedule();
       return System.schedule('Update IsReleased Batch job :',CRON_EXPRESSION,sc);
    }    

}