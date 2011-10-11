(function() {
  var server;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  server = (require('dgram')).createSocket('udp4');
  server.on('message', __bind(function(msg, rinfo) {
    return console.log("got " + msg);
  }, this));
  server.bind(6789);
}).call(this);
