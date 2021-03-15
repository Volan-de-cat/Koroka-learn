public with sharing class AnomalyDetector {

    public Anomaly_Range_Configuration__c anomalyRandeSetting;

    public AnomalyDetector() {
        this.anomalyRandeSetting = Anomaly_Range_Configuration__c.getOrgDefaults();
    }

    public List<Anomaly__c> detectAnomaly(Weather__c weather){
/*        bool Humidity_Anomaly=false;
        bool Pressure_Anomaly=false;
        bool Tempreature_Anomaly=false;*/
        List<Anomaly__c> anomaliesToSave = new List<Anomaly__c>();
     if (/*!Humidity_Anomaly &&*/ (anomalyRandeSetting.Max_Humidity__c<=weather.Humidity__c || anomalyRandeSetting.Min_Humidity__c>=weather.Humidity__c)){
         anomaliesToSave.add(new Anomaly__c(
             Type__c='Humidity Anomaly'
         ));  
//         Humidity_Anomaly=true;
     }
     if (/*!Pressure_Anomaly &&*/ (anomalyRandeSetting.Max_Pressure__c<=weather.Pressure__c || anomalyRandeSetting.Min_Pressure__c>=weather.Pressure__c)){
        anomaliesToSave.add(new Anomaly__c(
            Type__c='Pressure Anomaly'
        ));  
 //       Pressure_Anomaly=true;
    }
     if (/*!Tempreature_Anomaly && */(anomalyRandeSetting.Max_Temperature__c<=weather.Maximum_Temperature__c || anomalyRandeSetting.Min_Temperature__c>=weather.Minimal_Temperature__c)){
        anomaliesToSave.add(new Anomaly__c(
            Type__c='Temperature Anomaly'
        )); 
 //       Tempreature_Anomaly=true;
    }
        return anomaliesToSave;
    }
}