# run coffee node_udp_server.coffee for the server side
log = Ti.API.info
udp = require 'chrisfjones.titanium_module_udp'

Ti.UI.setBackgroundColor '#000'

window = Ti.UI.createWindow
  backgroundColor:'white'

@socket = udp.createUDP()
@i = 0

button = Ti.UI.createButton
  title: 'send'
button.addEventListener 'click', =>
  @i++
  log "#{@i} todo: send some stuff via udp"
  @socket.send "#{@i}", "127.0.0.1", 6789

window.add button
window.open()
