@isTest
public with sharing class UpdateIsReleasedSchedulableTest {
    
  static testMethod void testSchedulable() {        
         test.starttest();
         UpdateIsReleasedSchedule myClass = new UpdateIsReleasedSchedule ();   
         String chron = '0 00 00 * * ?';        
         system.schedule('Test Sched', chron, myClass);
         UpdateIsReleasedSchedule.scheduleBatch();
         test.stopTest();
    }

}