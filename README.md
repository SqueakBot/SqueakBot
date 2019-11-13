# SqueakBot
Javascript 401 Midterm Project - Novemeber 2019

--------------------------------------------------

### We are deployed on _____

--------------------------------------------------
### run
`nodemon index.js`

--------------------------------------------------

## Squeakbot

***[Explain your app, should be at least a paragraph. What does it do? Why should I use? Sell your product!]***
Squeakbot is a helpful mock interviewer for the phase of your life when you are practicing common whiteboard questions in preparation for job interviews in the tech industry. It uses AI technology and a raspberry pi zero to listen to your request and output a question. When you ask it, "Give me a challenge," it will recieve your request through a microphone on a voice bonnet. Using a Node Server, it pulls a random question from a SQL database and reads it out loud to you through a speaker. 

Authors: Adrian Huebner, Julie Erlemeier, Alistair Blake, David Zheng, Avrey Brown

## User Stories

1. As a user at Code Fellows, I want a device to remind me what code challenges are available, so I can improve my skills.
2. As a developer of this app, I want to create a database, so that it can hold all the code challenges.
3. As a designer of the product, I want to make the product appealing, so the user can have an enjoyable experience.
4. As a developer of this app, I want the device to have the ability to play music, so the user can have that option while coding.
5. As an experienced developer, I want to check in to see the current code challenges in today’s world, so that I can improve my skills.

--------------------------------------------------

## Tools Used

VS Code
SSH
Google Voice Kit with Raspberry pi zero
AIY Project App (Android): allows developer to connect to raspberry pi through a wireless network connection by providing an IP address. 
Google CloudSpeech API

- NodeJS
- ExpressJS
- PostgresQL database
- Google Cloud Speech API
- Hardware
  * Google Voice Kit
    * Raspberry pi zero
    * Voice bonnet
    * Speaker
  * Keyboard
  * Mouse
  * Monitor
  * MicroUSB to USB cable
  
---------------------------------

## Getting Started

Clone this repository to your local machine.
```
<!-- $ git clone https://github.com/YourRepo/YourProject.git -->
```
Once downloaded, you can either use Visual Studio 2017 (or greater) to build the web application.
```
cd YourRepo/YourProject
`npm i`
```
Install all dependencies needed for the project.
```
PostgresQL Database
* CREATE DATABASE <name of database>
* `psql -f <schema.sql> -d <database name>`
<!-- * explain how to use the database * -->
```
Create a .env file
* Define a PORT
* Add your Database URL: DATABASE_URL=postgresql://localhost:5432/<databasename>
* For more details see section titled: 
```
cd YourRepo/YourProject
`npm start ` OR `nodemon`
```
---------------------------

## Database Entity-Relationship-Diagram

![RED-for-SqueakBot](./assets/DB_for_SqueakBot.png)
---------------------------

## SQL DATABASE USAGE

### User Table

- id
  - type: String
  - key: Primary Key
- username
  - type: String
- email
  - type: String
- password
  - type: String

### Challanges

- id
  - type: String
  - key: Primary Key
- challanges
  - type: String
- hint
  - type: String

### Saved Challanges

- 1 to Many relationship (One user can have many saved challanges)
- user_id
  - type: String
  - key: Foreign Key
- challenge_id
  - type: String
  - key: Foreign Key
- completed
  - type: String

### Challenges Tests

- 1 to Many (Challenge can have many tests)
- user_id
  - type: String
  - key: Foreign Key
- test_id
  - type: String
  - key: Foreign Key

### Tests

- id
  - type: String
  - key: Primary Key
- input
  - type: String
- output
  - type: String

---------------------------------

## Usage
***[Provide some images of your app that shows how it can be used with brief description as title]***

### Overview of Recent Posts
![Overview of Recent Posts](https://via.placeholder.com/500x250)

### Creating a Post
![Post Creation](https://via.placeholder.com/500x250)

### Enriching a Post
![Enriching Post](https://via.placeholder.com/500x250)

### Viewing Post Details
![Details of Post](https://via.placeholder.com/500x250)

---------------------------
## Data Flow (Frontend, Backend, REST API)
***[Add a clean and clear explanation of what the data flow is. Walk me through it.]***
![Data Flow Diagram](/assets/img/Flowchart.png)