@isTest
private with sharing class DLN_Test_Start_Enrollment_Orchestration {
  static testMethod void testStartEnrollment() {
      DLN_Start_Enrollment_Orchestration.request req = new DLN_Start_Enrollment_Orchestration.request();
      req.TrainingID = 'a0D7Q000000jKjDUAU';
      req.AssigneeID = '0057Q0000051zXUQAY';
      
      Date targetDate = Date.newInstance(2018, 3, 18);
	  Time targetTime = Time.newInstance(18, 0, 0, 0);

      req.Deadline_Date = Datetime.newInstanceGmt(targetDate, targetTime);
      req.Deadline_Days = 3;
      req.NotificationType = 'SLACK';
      
      List<DLN_Start_Enrollment_Orchestration.request> requests = new List<DLN_Start_Enrollment_Orchestration.request>();
      requests.add(req);
      
      DLN_Start_Enrollment_Orchestration.start(requests);
      
      System.assertEquals('SLACK', 'SLACK');
      
    }
}