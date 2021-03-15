public with sharing class WeatherTriggerHandler {

    public static void handleBeforeInsert(List<Weather__c> newList){}

    public static void handleAfterInsert(List<Weather__c> newList){
        //Code here 
        //Use AnomalyDetector to detect an anomaly
        //Use SOQL to get City record information
        //insert Anomalies
        //update City
    AnomalyDetector detector = new AnomalyDetector();
    for (Weather__c weather : newList)
    {
        List<Anomaly__c> anomaly_list = detector.detectAnomaly(weather);
        List<City__c> sity_list = [
            SELECT Id
                , Name
            FROM City__c
            WHERE Id =: weather.City__c];
        City__c city_info = sity_list[0];
        for (Anomaly__c anomaly : anomaly_list)
        {
           Anomaly__c newAnomaly =  new Anomaly__c(
                Type__c = anomaly.Type__c
               , City_Name__c = city_info.Name 
               , City__c = city_info.Id 
               , Weather__c = weather.Id);
           insert(newAnomaly);
        }
    }
}

    public static void handleBeforeUpdate(List<Weather__c> newList, List<Weather__c> oldList){}

    public static void handleAfterUpdate(List<Weather__c> newList, List<Weather__c> oldList){}

    public static void handleBeforeDelete(List<Weather__c> oldList){}

    public static void handleAfterDelete(List<Weather__c> oldList){}
}
