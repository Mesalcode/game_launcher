# Game launcher - WP2, 8th grade
### General
* able to launch **self programmed online/offline games and simulations**
* can handle **third party programs (games)** (addable by user and preinstalled)
### Context
Graded half years **school project for WP2 informatics class** (8th Grade, started March 2020)
### Updates
This project will not be maintained after the end of the projects time span. This means, there will be **no** feature updates, content updates or bug fixes after the deadline. 
### Setup
In this paragraph, there will be instructions on how to setup the backend and the game launcher itself on your computer, and how to change configurations.
#### 1. Clone or download repository
To begin with, you will need to clone/download the repository to your computer.  

**There are to ways to do so:**

Way 1:  
If you already have installed git to your path you can simple use the following command to clone the repo.
    git clone https://github.com/Mesalcode/game_launcher.git


### Implementation
* **Frontend/User interface:** Native [Processing](https://processing.org/) and using its [processing-sound](https://github.com/processing/processing-sound) library
* **Backend:** Portable [NodeJS](https://nodejs.org/) server interacting with [MongoDB](https://www.mongodb.com/) database, receiving fetches using [Express](https://expressjs.com/) - MEN-Stack ([MEAN](https://en.wikipedia.org/wiki/MEAN_(solution_stack)) without Angular)
#### NodeJS modules
* [Express](https://www.npmjs.com/package/express)
* [MongoDB](https://www.npmjs.com/package/mongodb)
* [Readline](https://www.npmjs.com/package/readline)