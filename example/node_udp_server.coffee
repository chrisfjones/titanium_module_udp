server = (require 'dgram').createSocket 'udp4'
server.on 'message', (msg, rinfo) =>
  console.log "got #{msg}"
server.bind 6789
