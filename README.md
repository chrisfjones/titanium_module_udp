UDP send support for Titanium (ios-only and naive, but it works)
===

Install:
  [Download a zip]: https://github.com/chrisfjones/titanium_module_udp/archives/master
  cp chrisfjones.titanium-module-udp-iphone-x.x.zip /Library/Application\ Support/Titanium/
Use:
  udp    = require('chrisfjones.titanium_module_udp');
  socket = udp.createUDP();
  socket.send("hi", "127.0.0.1", 6789);
Also, there is a simple udp server in /examples:
  node example/node_udp_server.js
  or, if you're cool
  coffee example/node_udp_server.coffee
Contribute:
  pretty please
