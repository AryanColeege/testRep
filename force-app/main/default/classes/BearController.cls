public with sharing class BearController {
    @AuraEnabled(Cacheable=true)
    public static mahijat__Bear__c[] getAllBears() {
        return [SELECT Id, Name, Age__c, Sex__c, Height__c, Weight__c,
            Location__Latitude__s, Location__Longitude__s, Supervisor__r.Name
            FROM mahijat__Bear__c ORDER BY Name LIMIT 50];
    }
    
    @AuraEnabled(Cacheable=true)
    public static mahijat__Bear__c[] getOldestBears() {
        return [SELECT Id, Name, Age__c, Sex__c, Height__c, Weight__c,
            Location__Latitude__s, Location__Longitude__s, Supervisor__r.Name
            FROM mahijat__Bear__c ORDER BY Age__c DESC LIMIT 3];
    }
    @AuraEnabled(Cacheable=true)
    public static mahijat__Bear__c[] searchBears(String searchTerm) {
        // Return all bears when no search term
        searchTerm = searchTerm.trim();
        if (searchTerm == '') {
            return getAllBears();
        }
        // Prepare query paramters
        searchTerm = '%'+ searchTerm +'%';
        // Execute search query
        return [SELECT Id, Name, Age__c, Sex__c, Height__c, Weight__c,
            Location__Latitude__s, Location__Longitude__s, Supervisor__r.Name
            FROM mahijat__Bear__c WHERE Name LIKE :searchTerm ORDER BY Name LIMIT 50];
    }
}