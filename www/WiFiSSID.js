var argscheck = require('cordova/argscheck'),
  utils = require('cordova/utils'),
  exec = require('cordova/exec');

var WiFiSSID = function() {};

WiFiSSID.getSSID = function(callback) {
  exec(callback, callback, "WiFiSSID", "getSSID", []);
};

module.exports = WiFiSSID;
