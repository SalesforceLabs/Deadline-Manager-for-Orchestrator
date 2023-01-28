public class DLN_Start_Enrollment_Orchestration     {
 //Instance of the Flow
   public Flow.Interview.DLN_Enrollment_Example myFlow {get; set;}
   public Double value {get; set;}

   @InvocableMethod (label = 'Start Enrollment Orchestation' description = 'Starts an enrollment orchestration instance to give an example on how to manage different deadlines')
   public static void start(List<Request> req) {
      Map<String, Object> myMap = new Map<String, Object>();
      myMap.put('Training', req[0].TrainingID);
      myMap.put('AssigneeID', req[0].AssigneeID);
      User usr = [Select UserName From User where Id = :req[0].AssigneeID];
      myMap.put('UserName', usr.UserName);
      if (req[0].Deadline_Date!=null)
        myMap.put('Deadline_Date', req[0].Deadline_Date);
      else
        myMap.put('Deadline_Date', datetime.now());
      myMap.put('Deadline_Days', req[0].Deadline_Days);
      myMap.put('NotificationType', req[0].NotificationType);
      Flow.Interview.DLN_Enrollment_Example myFlow = new Flow.Interview.DLN_Enrollment_Example(myMap);
      myFlow.start();
   }
    
     public class Request {
    @InvocableVariable(required=true)
     public DateTime Deadline_Date;
    @InvocableVariable(required=true)
     public Integer Deadline_Days;
    @InvocableVariable(required=true)
     public String TrainingID;
    @InvocableVariable(required=true)
     public String AssigneeID;
    @InvocableVariable(required=true)
     public String NotificationType;
    
   }
}