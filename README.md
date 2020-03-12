# Game launcher - WP2, 8th grade
### General
* able to launch **self programmed online/offline games and simulations**
* can handle **third party programs (games)** (addable by user and preinstalled)
### Application list
* Atari Tennis (retro game, [see wikipedia article](https://en.wikipedia.org/wiki/Pong)) 
* Pac-Man (retro game, [see wikipedia article](https://en.wikipedia.org/wiki/Pac-Man))
* Running Game (endless runner game inspired by subway surfers, [see wikipedia article](https://en.wikipedia.org/wiki/Subway_Surfers))
### Context
Graded half years **school project for WP2 informatics class** (8th Grade, started March 2020)
### Updates
This project will not be maintained after the end of the projects time span. This means, there will be **no** feature updates, content updates or bug fixes after the deadline. 
### Setup
In this paragraph, there will be instructions on how to **setup the backend and the game launcher** itself on your computer, and how to change configurations.
#### 1. Clone or download repository
To begin with, you will need to clone/download the repository to your computer.  

**There are to ways to do so**

Way 1:  
If you already have installed git to your path you can simple use the following command to clone the repo.  
    ```git clone https://github.com/Mesalcode/game_launcher.git```

Way 2:  
The other way is to download the repository in form of a zip file.  
To do so click on the **,,Clone or download"** button you can see over the files of this repository.
![alt text](https://raw.githubusercontent.com/Mesalcode/game_launcher/master/readme_clone_or_download.PNG "Clone or download button")
<br>Then, you need to click on **Download ZIP**, which will download the whole repository in form of a ZIP-file.

#### 2. Install NodeJS and modules
For the installation of NodeJS please refer to [the official NodeJS download page](https://nodejs.org/de/download/), which will list several ways of installing NodeJS on your computer. **Attention! Make sure that NodeJS ends up beeing in your PATH**, as this is gonna be necessary in the following steps.
<br>When you completed this step, you will need to install the [needed NodeJS modules](https://github.com/Mesalcode/game_launcher#nodejs-modules).
<br>You will find the command, you have to run in the command prompt/shell, when following the links listed.
![alt text](https://raw.githubusercontent.com/Mesalcode/game_launcher/master/readme_npm_command.PNG "NodeJS module installation example")
#### 3. Install and setup your MongoDB database
Instructions on how to setup your MongoDB database can be found [official MongoDB manual](https://docs.mongodb.com/manual/installation/).
Make sure to setup password security aswell.

### Implementation
* **Frontend/User interface:** Native [Processing](https://processing.org/) and using its [processing-sound](https://github.com/processing/processing-sound) library
* **Backend:** Portable [NodeJS](https://nodejs.org/) server interacting with [MongoDB](https://www.mongodb.com/) database, receiving fetches using [Express](https://expressjs.com/) - MEN-Stack ([MEAN](https://en.wikipedia.org/wiki/MEAN_(solution_stack)) without Angular)
#### NodeJS modules
* [Express](https://www.npmjs.com/package/express)
* [MongoDB](https://www.npmjs.com/package/mongodb)
* [Readline](https://www.npmjs.com/package/readline)