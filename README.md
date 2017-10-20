# bbva-challenge

I got a challenge from the people in BBVA and these were the requirements 

### Requirements:

Try to complete this coding challenge as soon as you can with your own code. We would really appreciate the originality rather than "googled" fancy code. You shall code it in Swift 3.

Create an iOS iPhone application project  that can fetch JSON data from the provided URL and displays the list of states information in a tabular format.

1.       Create an iOS Universal framework project that exports a custom UITableViewCell class. (Eg: Mycell.framework)

2.       Create an iOS app and import the above created framework to be used in this app

o This app will be Navigation Controller based application with single view controller

o The view controller will display a list of all the states fetched from the below URL in a UITableView.

§ Create a Network Controller class which is used to fetch the JSON data from the URL (http://services.groupkt.com/state/get/USA/all)

 

§ The JSON data from the URL response must be modeled in data model classes

o Each row must show all the details of the "State" data that is sent in the above URL, using the custom UITableViewCell from the framework (Eg: Mycell.framework created in step 1)

o Create a *NSString Category* class with a function that can convert the `"area": "135767SKM"` from KMS to Miles and returns String value. The area in "Miles" must be displayed in each row.

### Comments 

1. Create a component only for a class is overarchitecting the app `Mycell.framework` 
2. An app with be Navigation Controller based application with single view controller will have at least 2 view controllers. The navigation view and the root of that navigation.
3. It's a good practice to use structs when modeling
4. *Categories* are only part of Objective-C so it would be a hibrid app and not a Swift only app
4. Using a NSString extension to parse and transform the kilometers to miles it's a bad place. Using NSUnit would be better.
5. Please run the unit tests
