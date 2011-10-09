(function() {
  var button, log, udp, window;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  log = Ti.API.info;
  udp = require('chrisfjones.titanium_module_udp');
  Ti.UI.setBackgroundColor('#000');
  window = Ti.UI.createWindow({
    backgroundColor: 'white'
  });
  this.socket = udp.createUDP();
  this.i = 0;
  button = Ti.UI.createButton({
    title: 'send'
  });
  button.addEventListener('click', __bind(function() {
    this.i++;
    log("" + this.i + " todo: send some stuff via udp");
    return this.socket.send("" + this.i, "127.0.0.1", 6789);
  }, this));
  window.add(button);
  window.open();
}).call(this);
