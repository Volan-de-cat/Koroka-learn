public with sharing class WeatherTriggerHandler {

    public static void handleBeforeInsert(List<Weather__c> newList){}

    public static void handleAfterInsert(List<Weather__c> newList){
        //Code here 
        //Use AnomalyDetector to detect an anomaly
        //Use SOQL to get City record information
        //insert Anomalies
        //update City
    AnomalyDetector detector = new AnomalyDetector();
    Set<Id> IdCheck = new Set<Id>();
    for (Weather__c weat : newList)
    {
         IdCheck.add(weat.City__c);
    }
     List<City__c> sity_list = [
         SELECT Name
                , Id
         FROM City__c
         WHERE Id IN: IdCheck];
     City__c city_info = sity_list[0];
     List<Anomaly__c> anomaly_list = new List<Anomaly__c>();
    for (Weather__c weather : newList)
    {
        anomaly_list = detector.detectAnomaly(weather, city_info);
    }
    insert anomaly_list;
    }
}

    public static void handleBeforeUpdate(List<Weather__c> newList, List<Weather__c> oldList){}

    public static void handleAfterUpdate(List<Weather__c> newList, List<Weather__c> oldList){}

    public static void handleBeforeDelete(List<Weather__c> oldList){}

    public static void handleAfterDelete(List<Weather__c> oldList){}
}
