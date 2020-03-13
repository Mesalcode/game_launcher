const readline = require('readline')
const express = require('express')
const app = express()
const fs = require('fs')
const os = require('os');
var http = require('http')
const osutils = require('os-utils')
const loginSite = "/loginreq"
const registerSite = "/registerreq"
const restrictmentsSite = "/arreq"
const bugSite = "/submitbug"
const staffLoginSite = "/staffloginreq"
const expectedLoginParamCount = 4
const expectedRegisterParamCount = 11
const expectedStaffLoginParamCount = 4
let newestVersion = 1.0
let logFile = getLogFile()
const iplocation = require('iplocation').default
const requestIDLength = 10
const automaticRestartTime = 300000
var allowedIps = []
var allowedStaffIps = []
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/";
var requirements
async function checkREQU(){
    if (typeof requirements !== 'undefined'){
        let requ = requirements
        requirements = undefined
        return requ
    }else {
        await Sleep(300)
        return checkREQU()
    }
}
async function getRequirements(){
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var data0 = db.db("data1")
        data0.collection("userconfig").findOne({}, function(err, res) {
            if (err) throw err;
            try {
                requirements = String(res.nameMin)+"#"+String(res.nameMax)+"#"
                +String(res.ignMin)+"#"+String(res.ignMax)+"#"
                +String(res.securityQuestionMin)+"#"+String(res.securityQuestionMax)+"#"
                +String(res.encryptionLength)+"#"+String(res.validLanguages)+"#"+String(res.validGenders)
                db.close()
                
            } catch (error) {
                log("Error 404 on userconfig lookup","Data")
                db.close()
                requirements = "404"
            }
        })
    })
    return await checkREQU()
}
var nameMinLength
var nameMaxLength
var ignMinLength
var ignMaxLength
var sqMinLength
var sqMaxLength
var encryptionLength
var validLanguages
var validGenders
async function loadReqs(){
    const reqs = (await getRequirements()).split("#")
    log("Loaded requirements from database ["+reqs+"]","DATA")
    nameMinLength = parseInt(reqs[0])
    nameMaxLength = parseInt(reqs[1])
    ignMinLength = parseInt(reqs[2])
    ignMaxLength = parseInt(reqs[3])
    sqMinLength = parseInt(reqs[4])
    sqMaxLength = parseInt(reqs[5])
    encryptionLength = parseInt(reqs[6])
}
loadReqs()
validLanguages = ["German-DE","English-UK","English-US","Korean-SK"]
validGenders = ["MALE","FEMALE","DIVERSE"]
function insertUser(toInsert){
MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var data0 = db.db("data0")
    data0.collection("users").insertOne(toInsert, function(err, res) {
        if (err) throw err;
        log("Inserted new user data to mongo.","DATA");
        db.close();
      }
    )
  });
}
function Sleep(milliseconds) {
    return new Promise(resolve => setTimeout(resolve, milliseconds));
 }
var returnVal0
async function checkRV0(){
    if (typeof returnVal0 !== 'undefined'){
        let rv = returnVal0
        returnVal0 = undefined
        return rv
    }else {
        await Sleep(300)
        return checkRV0()
    }
}
async function isUsernameAvailable(name){
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var data0 = db.db("data0")
        data0.collection("users").findOne({ign:name}, function(err, res) {
            if (err) throw err;
            try {
                res.ign
                log("Checked name " + name + " - not available","DATA")
                db.close()
                returnVal0 = false
            } catch (error) {
                log("Checked name " + name + " - available","DATA")
                db.close()
                returnVal0 = true
            }
        })
    })
    return await checkRV0()
}
var returnVal1
async function checkRV1(){
    if (typeof returnVal1 !== 'undefined'){
        let rv = returnVal1
        returnVal1 = undefined
        return rv
    }else {
        await Sleep(300)
        return checkRV1()
    }
}
async function isMailAvailable(mail){
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var data0 = db.db("data0")
        data0.collection("users").findOne({mail:mail}, function(err, res) {
            if (err) throw err;
            try {
                res.mail
                log("Checked mail " + mail + " - not available","DATA")
                db.close()
                returnVal1 = false
            } catch (error) {
                log("Checked mail " + mail + " - available","DATAE")
                db.close()
                returnVal1 = true
            }
        })
    })
    return await checkRV1()
}
function insertStaff(toInsert){
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var data0 = db.db("data0")
        data0.collection("staff").insertOne(toInsert, function(err, res) {
            if (err) throw err;
            log("Inserted new staff data to mongo.","DATA");
            db.close();
          }
        )
      });
    }
const {execSync} = require('child_process')
log("Server console for informatics project", "Mainthread")
log("© Alexander Mertens, 2020","Mainthread")
log("--------------------------------------","Mainthread")
const getIpAddressFromRequest = (request) => {
    let ipAddr = request.connection.remoteAddress;
  
    if (request.headers && request.headers['x-forwarded-for']) {
      [ipAddr] = request.headers['x-forwarded-for'].split(',');
    }
    return ipAddr;
  };
let updateLink = "http://www.downloadseite.de/update_"+String(newestVersion)+".apk"
staff_http = http.createServer(function (req, res) {
    const path = req.url.substring(req.url.substring(8).indexOf("/")+1)
    if (path=="/staff_console"){
    if (allowedStaffIps.includes(getIpAddressFromRequest(req))){
    res.write('Hello World!'); //write a response to the client
    res.end(); //end the response

    }else {
        var readStream = fs.createReadStream('staff_login.html','utf-8');
        readStream.pipe(res)
    }
}
  }) 
app.get(restrictmentsSite, async (req, res) =>{
    const requestID = generateID(requestIDLength)
    log("restrictments", requestID)
    log("Connection established at port 300", requestID)
    log("IP: " + getIpAddressFromRequest(req), requestID)
    iplocation(String(getIpAddressFromRequest(req)), [], (error, res) => {
        if (error) throw error;
        log("IP lookup results: ", requestID)
        log("ip: "+res.ip, requestID) 
        log("country: "+res.country, requestID)  
        log("country code: "+res.countryCode, requestID)  
        log("city: "+res.city, requestID)  
        log("cities postal: " + res.postal,requestID)
        log("latitude: " + res.latitude,requestID)
        log("longitude: " + res.longitude,requestID)
        log("timezone: " + res.timezone,requestID)
        log("advanced lookup: https://whatismyipaddress.com/ip/"+String(getIpAddressFromRequest(req)),requestID)
    })
    const concatedData = String(nameMinLength)+"#"+String(nameMaxLength)
    +"#"+String(ignMinLength)+"#"+String(ignMaxLength)+"#"
    +String(sqMinLength)+"#"+String(sqMaxLength)+"#"
    +String(encryptionLength)+"#["+String(validLanguages)+"]#["+String(validGenders)+"]"
    res.send(concatedData)
    log("send concated restrictment data to client [" + concatedData + "]")
})
app.get(registerSite, async (req, res) =>{
    const requestID = generateID(requestIDLength)
    log("register", requestID)
    log("Connection established at port 300", requestID)
    log("IP: " + getIpAddressFromRequest(req), requestID)
    iplocation(String(getIpAddressFromRequest(req)), [], (error, res) => {
        if (error) throw error;
        log("IP lookup results: ", requestID)
        log("ip: "+res.ip, requestID) 
        log("country: "+res.country, requestID)  
        log("country code: "+res.countryCode, requestID)  
        log("city: "+res.city, requestID)  
        log("cities postal: " + res.postal,requestID)
        log("latitude: " + res.latitude,requestID)
        log("longitude: " + res.longitude,requestID)
        log("timezone: " + res.timezone,requestID)
        log("advanced lookup: https://whatismyipaddress.com/ip/"+String(getIpAddressFromRequest(req)),requestID)
    })
    log("Blank request: " + req.url, requestID)
    const request_params = req.url.replace(registerSite).split("?")
    log("Parameter-formed request: " + request_params, requestID)
    let filtered_params = trimArray(request_params)
    log("Trimmed parameters: " + filtered_params, requestID)
    fixSpaces(filtered_params)
    log("Space-applied parameters: " + filtered_params, requestID)
    filtered_params = filtered_params.slice(1,filtered_params.length)
    log("Parameters: " + filtered_params, requestID)
   /* log(filtered_params.length==expectedRegisterParamCount)
    log(filtered_params[0].length>=nameMinLength&&filtered_params[0].length<=nameMaxLength)
    log(filtered_params[1].length>=ignMinLength&&filtered_params[1].length<=ignMaxLength)
    log(validLanguages.includes(filtered_params[2]))
    log(validGenders.includes(filtered_params[3])&&filtered_params[7].length==encryptionLength)
    log(filtered_params[8].length>=sqMinLength&&filtered_params[8].length<=sqMaxLength)
    log(filtered_params[9].length==encryptionLength)
    log((filtered_params[10]=='true'||filtered_params[10]=='false')) */

    if (filtered_params.length==expectedRegisterParamCount){
        if (filtered_params[0].length>=nameMinLength&&filtered_params[0].length<=nameMaxLength&&filtered_params[1].length>=ignMinLength
            &&filtered_params[1].length<=ignMaxLength&&validLanguages.includes(filtered_params[2])
            &&validGenders.includes(filtered_params[3])&&filtered_params[7].length==encryptionLength
                &&filtered_params[8].length>=sqMinLength&&filtered_params[8].length<=sqMaxLength
                &&filtered_params[9].length==encryptionLength&&(filtered_params[10]=='true'||filtered_params[10]=='false')
                &&await isUsernameAvailable(filtered_params[1])&&await isMailAvailable(filtered_params[6]))
            {
        insertUser(
            {
                name:filtered_params[0],
                name_change_date:"",
                ign:filtered_params[1],
                ign_changes:0,
                language:filtered_params[2],
                gender:filtered_params[3],
                gender_changes:0,
                birth:filtered_params[4],
                created:filtered_params[5],
                mail:filtered_params[6],
                password:filtered_params[7],
                security_question:filtered_params[8],
                security_question_answer:filtered_params[9],
                tfa:(filtered_params[10]=='true')==true,
                ban:false,
                ban_expire_date:"",
                ban_count:0,
                ban_reasons:"",
                last_login:"",
            }
        )
        res.send("300")
        log("Valid registration data will now be written to mongodb.",requestID)
        }else {
            res.send("100")
            log("Invalid registration data!",requestID)
        }
        
    }else{
        res.send("100")
        log("Invalid registration data!",requestID)
    }
})
app.get(staffLoginSite, (req, res) =>{
    const requestID = generateID(requestIDLength)
    log("submitBug", requestID)
    log("Connection established at port 300", requestID)
    log("IP: " + getIpAddressFromRequest(req), requestID)
    iplocation(String(getIpAddressFromRequest(req)), [], (error, res) => {
        if (error) throw error;
        log("IP lookup results: ", requestID)
        log("ip: "+res.ip, requestID) 
        log("country: "+res.country, requestID)  
        log("country code: "+res.countryCode, requestID)  
        log("city: "+res.city, requestID)  
        log("cities postal: " + res.postal,requestID)
        log("latitude: " + res.latitude,requestID)
        log("longitude: " + res.longitude,requestID)
        log("timezone: " + res.timezone,requestID)
        log("advanced lookup: https://whatismyipaddress.com/ip/"+String(getIpAddressFromRequest(req)),requestID)
    })
    log("Blank request: " + req.url, requestID)
    const request_params = req.url.replace(staffLoginSite).split("?")
    log("Parameter-formed request: " + request_params, requestID)
    let filtered_params = trimArray(request_params)
    log("Trimmed parameters: " + filtered_params, requestID)
    fixSpaces(filtered_params)
    log("Space-applied parameters: " + filtered_params, requestID)
    filtered_params = filtered_params.slice(1,filtered_params.length)
    log("Parameters: " + filtered_params, requestID)
    if (filtered_params.length==expectedStaffLoginParamCount){
        allowedStaffIps.push(getIpAddressFromRequest(req))
        res.send("300")

    }else{
        res.send("100")
    }
})
app.get(bugSite, (req, res) =>{
    const requestID = generateID(requestIDLength)
    log("submitBug", requestID)
    log("Connection established at port 300", requestID)
    log("IP: " + getIpAddressFromRequest(req), requestID)
    iplocation(String(getIpAddressFromRequest(req)), [], (error, res) => {
        if (error) throw error;
        log("IP lookup results: ", requestID)
        log("ip: "+res.ip, requestID) 
        log("country: "+res.country, requestID)  
        log("country code: "+res.countryCode, requestID)  
        log("city: "+res.city, requestID)  
        log("cities postal: " + res.postal,requestID)
        log("latitude: " + res.latitude,requestID)
        log("longitude: " + res.longitude,requestID)
        log("timezone: " + res.timezone,requestID)
        log("advanced lookup: https://whatismyipaddress.com/ip/"+String(getIpAddressFromRequest(req)),requestID)
    })
    if (allowedIps.includes(getIpAddressFromRequest(req))){
        pushBug("Client",req.url.substring(req.url.indexOf("?")+1).split("%20").join(" "))
        res.send("300")
    }else {
        res.send("100")
    }

})
app.get(loginSite, (req, res) =>{
    const requestID = generateID(requestIDLength)
    log("loginreq", requestID)
    log("Connection established at port 300", requestID)
    log("IP: " + getIpAddressFromRequest(req), requestID)
    iplocation(String(getIpAddressFromRequest(req)), [], (error, res) => {
        if (error) throw error;
        log("IP lookup results: ", requestID)
        log("ip: "+res.ip, requestID) 
        log("country: "+res.country, requestID)  
        log("country code: "+res.countryCode, requestID)  
        log("city: "+res.city, requestID)  
        log("cities postal: " + res.postal,requestID)
        log("latitude: " + res.latitude,requestID)
        log("longitude: " + res.longitude,requestID)
        log("timezone: " + res.timezone,requestID)
        log("advanced lookup: https://whatismyipaddress.com/ip/"+String(getIpAddressFromRequest(req)),requestID)
    })
    log("Blank request: " + req.url, requestID)
    const request_params = req.url.replace(loginSite).split("?")
    log("Parameter-formed request: " + request_params, requestID)
    let filtered_params = trimArray(request_params)
    log("Trimmed parameters: " + filtered_params, requestID)
    fixSpaces(filtered_params)
    log("Space-applied parameters: " + filtered_params, requestID)
    filtered_params = filtered_params.slice(1,filtered_params.length)
    log("Parameters: " + filtered_params, requestID)
    if (filtered_params.length==expectedLoginParamCount){
        if (newestVersion>filtered_params[3]){
            log("Outdated version ["+filtered_params[3]+"<"+newestVersion+"], sending link to update", requestID)
            res.send("200?"+updateLink)
            log("Send code 200 ["+"200?"+updateLink+"]", requestID)
        }else if (newestVersion<filtered_params[3]){
            log("Version newer than latest release ["+filtered_params[3]+">"+newestVersion+"], sending link to downgrade", requestID)
            res.send("201?"+updateLink)
            log("Send code 201 ["+"201?"+updateLink+"]", requestID)
        }else {
            log("Versions equal to each other ["+filtered_params[3]+"="+newestVersion+"]", requestID)
            allowedIps.push(getIpAddressFromRequest(req))
            res.send("300")
            log("Send code 300", requestID)
        }
    }else {
        res.send("100", requestID)
    }
    osutils.cpuUsage(function (v){
        log("CPU usage: " + String(v*100) +"%","Performance")
    })
    log("Free memory: "+String(osutils.freememPercentage()*100)+"%","Performance")
    log("Runtime: " + String(osutils.processUptime()/60)+" minutes","Performance")
})
log("Waiting for port to open in case of restart [7s]","Mainthread")
setTimeout(() =>{
    var server  = app.listen(300)
    staff_http.listen(80)
    log("Now listening on port 300", "Mainthread")
},7000)
setTimeout(() =>{
    log("Performing automatic restart [SET_DELAY="+String(automaticRestartTime)+"]","Performance")
    restartServer()
},automaticRestartTime)
function restartServer(){}
function generateID(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
       result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
 }
function getLogFile(){
    return "17_38_27_02_2020.log"
}
function log(toLog, id){
    console.log("["+String(id)+"] "+toLog)
    /*fs.appendFile(logFile, "["+String(id)+"] "+toLog, (err) => {
        if (err) throw err;
    })*/
}
function pushBug(sender, text){
    log("bug pushed '" + text + "'","Mainthread")
}
function trimArray(toTrim){
    return toTrim.filter(function (el) {return el != '';})
}
function fixSpaces(toFix){

    for (let i = 0; i < toFix.length;i++){
        toFix[i] = toFix[i].split("%20").join(" ")
        }
}