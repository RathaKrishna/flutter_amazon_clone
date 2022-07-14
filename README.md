# Flutter Amazon Clone
<p align="center">
 <img width="100px" src="https://res.cloudinary.com/rkcloud/image/upload/v1657523587/j5moz55tojlhhhvkjso4.png" align="center" alt="" />
 <h2 align="center">Fullstack Flutter Amazon Clone  </h2>
 <p align="center">A Full Stack Amazon Clone app with Flutter!</p>
</p>

# About
Full Stack Working Amazon Clone app with Admin Dashboard using Flutter and Backend with NodeJs and MongoBD + Atlas.

## Demo
<div class="row">

<div class="column">
<h3> Front end </h3>
<img src= "https://user-images.githubusercontent.com/3157579/178204057-dd51e81c-bc60-41db-b626-600a1e2a130e.gif"/>
</div>

<div class="column">
<h3> Admin Panel <h3>
<img src= "https://user-images.githubusercontent.com/3157579/178206855-2368a5e9-12bf-4110-9d50-45a91d632804.gif" />
</div>

</div>


## Getting Started

This project is a Full stack app for Amazon clone with Admin panel and Server side Flutter and Nodejs application.

### Features
- User Registration and Login with email and password
- Persisting Auth State with Provider
- Search Products
- Rate Products
- Add to Cart Product
- Buy product with ApplePay and Gpay
- Search Category wise products
- Add Multiple Address
- Save default Address
- Update and Delete Address
- My Account 
- Your Orders to view recent Orders
- Product Details
- Getting Deal of the Day
- Viewing Order Details & Status
- Settings Screen
- Amazon Pay, miniTV, Funzone
- Sign Out
... and many more
- Admin Panel
    - View All Products
    - Add new Products
    - Delelte Products
    - View Orders and Change current status
    - Viewing Total Earnings
    - Viewing Category Based Earnings (on Graph)
    
### Requirements

* Get a free API Key at https://cloudinary.com/ for store products image
* Update Cloud name and Upload preset at ``` lib -> features -> admin -> services -> admin_services.dart ```
* ![image](https://user-images.githubusercontent.com/3157579/178201535-ca05d27a-4b32-4586-b2eb-fdbee71447f0.png)
* Create MongoDB at https://cloud.mongodb.com/  and Add your connection string into your application code
* ``` project -> server -> index.js -> const DB = "mongodb+srv://***" // Please Enter your MongoDB URL ```
* ![image](https://user-images.githubusercontent.com/3157579/178202797-a25c0423-93a1-40dc-a407-49c4cc0c0ab2.png)
* Head to ```lib -> constants -> global_variables.dart file```, replace with your IP Address.


### Installing Server
To run the server, run the following commands: 
 ``` cd server
  npm install
  npm run dev (for continuous development)
  OR
  npm start (to run script 1 time)
  ```


### Run the App
Before starting 🏁, you need to have Flutter installed.
```
# Clone this project
$ git clone https://github.com/RathaKrishna/flutter_amazon_clone.git

# Access
$ cd amazon_clone

# Pull dependencies
$ flutter pub get

# Run the project (emulator or physical device needs to be connected first)
$ flutter run

# Build an apk
$ flutter build apk --split-per-abi
```




