@isTest
public class UpdateIsReleasedBatchTest {
    @isTest
    private static void testUpdateIsReleasedTrue(){

        Movie__c mov1 = (Movie__c)TestDataFactory.createSObject('Movie__c', new Map<String,Object>{
            'Name ' => 'Movie1',
            'Release_date__c' =>  Date.newInstance(2023, 02, 09)
          },true);

        Test.startTest();
          UpdateIsReleasedBatch batch = new UpdateIsReleasedBatch();
          Database.executeBatch(batch);
        Test.stopTest();
        
        mov1 = [SELECT IsReleased__c FROM Movie__c WHERE id = :mov1.id LIMIT 1];
        System.assertEquals(true, mov1.IsReleased__c, 'ERROR Batch did not update IsReleased__c to True');


    }
    @isTest
    private static void testUpdateIsReleasedFalse(){

        Movie__c mov2 = (Movie__c)TestDataFactory.createSObject('Movie__c', new Map<String,Object>{
            'Name ' => 'Movie2',
            'Release_date__c' =>  Date.newInstance(2023, 05, 09)
          },true);

        Test.startTest();
          UpdateIsReleasedBatch batch = new UpdateIsReleasedBatch();
          Database.executeBatch(batch);
        Test.stopTest();
        
        mov2 = [SELECT IsReleased__c FROM Movie__c WHERE id = :mov2.id LIMIT 1];
        System.assertEquals(false, mov2.IsReleased__c, 'ERROR Batch did not update IsReleased__c to false');


    }
}