public with sharing class AnomalyDetector {

    public Anomaly_Range_Configuration__c anomalyRandeSetting;

    public AnomalyDetector() {
        this.anomalyRandeSetting = Anomaly_Range_Configuration__c.getOrgDefaults();
    }

    public List<Anomaly__c> detectAnomaly(Weather__c weather, City__c city_info){
        List<Anomaly__c> anomaliesToSave = new List<Anomaly__c>();
     if (anomalyRandeSetting.Max_Humidity__c<=weather.Humidity__c || anomalyRandeSetting.Min_Humidity__c>=weather.Humidity__c){
         anomaliesToSave.add(new Anomaly__c(
            Type__c = 'Humidity Anomaly'
            , Weather__c = weather.Humidity__c
            , City__c = weather.City__c
            , City_Name__c= city_info.Name
         ));  
     }
     if (anomalyRandeSetting.Max_Pressure__c<=weather.Pressure__c || anomalyRandeSetting.Min_Pressure__c>=weather.Pressure__c){
        anomaliesToSave.add(new Anomaly__c(
            Type__c = 'Pressure Anomaly'
            , Weather__c = weather.Pressure__c
            , City__c = weather.City__c
            , City_Name__c= city_info.Name
        ));  
    }
     if (anomalyRandeSetting.Max_Temperature__c<=weather.Maximum_Temperature__c){
        anomaliesToSave.add(new Anomaly__c(
            Type__c = 'Temperature Anomaly'
            , Weather__c = weather.Maximum_Temperature__c
            , City__c = weather.City__c
            , City_Name__c= city_info.Name
        )); 
    }
     if (anomalyRandeSetting.Min_Temperature__c>=weather.Minimal_Temperature__c){
        anomaliesToSave.add(new Anomaly__c(
            Type__c = 'Temperature Anomaly'
            , Weather__c = weather.Minimal_Temperature__c
            , City__c = weather.City__c
            , City_Name__c= city_info.Name
        )); 
    }  
    return anomaliesToSave;
    }
}