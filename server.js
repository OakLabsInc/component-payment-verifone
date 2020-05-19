
const express = require('express')
const bodyParser = require('body-parser')
const { join } = require('path')
const _ = require('lodash')

var execFile = require('child_process').execFile


const app = express()
const port = process.env.PORT ? _.toNumber(process.env.PORT) : 9001

require('dotenv').config()
app.use(bodyParser.json());


var server =  app.listen(port, function () {
  var host = server.address().address;
  var port = server.address().port;
  console.log("Content Provider Service listening at http://%s:%s", host, port);
})

app.post('/', function (req, res) {
  // var child = spawn(join(__dirname,"PSDK_Test"));
  // console.log(req.body)

  // this launches the executable and returns immediately
  var child = execFile(join(__dirname,"PSDK_Test"), [JSON.stringify(req.body.cart), req.body.terminalIp],

    function (error, stdout, stderr) {
      if(error) {
        console.log(error)
        return 
      }
      // This callback is invoked once the child terminates
      // You'd want to check err/stderr as well!
      console.log("Here is the complete output of the program: ");
      console.log(stdout)
  });

})

