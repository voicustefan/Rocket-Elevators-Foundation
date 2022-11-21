#USAGE and DESCRIPTION

To use our team Rocket_Elevators APIs you need 

1. to go are website: http://rocketelevatorsss.com/

2. we've implemented 7 APIs into our website :Google Maps, Twilio, Slack, DropBox, Notify EU, Amazone Polly, FreshDesk. 

	[GOOGLE API]You can use the Google Map's API as an extension within our secure back office (reserved for Rocket Elevators 		employees) in order to geolocate our customers on a map and display statistics on a location.
	
	
	[TWILIO] you can use Twilio's API to to allow the platform to get in touch with the technicians in case of problems.
If the status of an Elevator in the database changes to "Intervention" status, the building's technical contact must be identified and an SMS must be sent to the telephone number associated with this contact.
In this case, the designated contact must be the coach assigned to each team, and he must receive the alerts on his mobile phone.


	[SLACK] in Slack's API case when a controller changes the status of an elevator, this status is reflected in the information system and persists in the operational database . When these status changes occur, a message is sent to the slack “elevator_operations” channel to leave a written record.
	The written message must have the following format:
	The Elevator [Elevator’s ID] with Serial Number [Serial Number] changed status from [Old Status] to [New Status]
	
	
	
	[DROPBOX] Dropbox's API allow archive documents in the cloud and the Dropbox API and its online storage allows this to be done in a simple and flexible way while allowing access to the file from anywhere thanks to the multiple interfaces provided by Dropbox. 
	
	PS.For each session the api will ask you for a new access token. You can ask the devs team for it. Moreover, you should download the dropbox app https://www.dropbox.com/install, to get notified when a file is getting drop to rocket elevators dropbox cloud storage. When a file is uploaded to dropbox you need to convert the file to a jpg/jpeg/png format.
	
	
	
	[Notify EU] this API is a historic and essential service provider in the field of email communication. It allows emails to be sent to a base of users who have authorized transactional communications at the time of their registration (Opt-in). Sendgrid builds on a solid reputation as an email processor that guarantees delivery and favorable classification of emails to major suppliers like Google, Microsoft and Yahoo.
	
	
	
	[ Amazone Polly]  Amazone Polly's API use its Artificial Intelligence to provides application developers with many services. Among the most used, there is a Text-to-Speech functionality which can be used on a multitude of platforms.
	
	
	
	[FRESHDESK] this API deliver quality customer service, managing customer requests should never leave a contact unanswered and ensure reasonable processing times. This is often the first of future customers.
	
#DEPENDENCIES

To be able to try those API, you need 

For only employee: access to back office and/or have the credentials.

#The devs team

    Aditya Menon Sreeraj
    
    Gianluca Ciccone
    
    Glory Jacques
    
    Stefan Voicu
    
    Yasmina Suwed


#Queries

Query 1
```
{
  building(id: 50){
    id
    addressOfTheBuilding
    createdAt
    updatedAt
  }
}
```
Query 2
```
{
  customer(id: 50){
    id
    customerCreationDate
    userId
    addressId
    companyContactPhone
    companyDescription
    companyName
    emailOfCompanyContact
    fullNameOfCompanyContact
    fullNameOfServiceTechnicalAuthority
    technicalAuthorityPhoneForService
    technicalManagerEmailForService
    createdAt
    updatedAt
  }
  address (id: 50){
    id   
    numberAndStreet
    postalCode
    city
    country
  	}
}
```






	
	
	
	

	
	





 
	
	
