require 'socket'
require 'base64'
 
def push(key)
  src     = '192.168.1.2'       # ip of remote
  mac     = '00-1C-C0-A2-F9-AA' # mac of remote
  remote  = 'python remote'     # remote name
  dst     = '10.0.0.9'       # ip of tv
  app     = 'python'            # iphone..iapp.samsung
  tv      = 'UN46C6500'          # iphone.LE32C650.iapp.samsung
  #s = Socket.new Socket::INET, Socket::SOCK_STREAM
  s = TCPSocket.new dst, 55000
  #s.connect Socket.pack_sockaddr_in(55000, dst)
  msg1 = "\x64\x00#{Base64.encode64(src).length.chr}\x00#{Base64.encode64(src)}#{Base64.encode64(mac).length.chr}\x00#{Base64.encode64(mac)}#{Base64.encode64(remote).length.chr}\x00#{Base64.encode64(remote)}"
  pkt1 = "\x00#{app.length.chr}\x00#{app}#{msg1.length.chr}\x00#{msg1}"
  s.send(pkt1,0)
  puts pkt1
  puts
  msg2 = "\x00\x00\x00#{Base64.encode64(key).length.chr}\x00#{Base64.encode64(key)}"
  pkt2 = "\x00#{tv.length.chr}\x00#{tv}#{msg2.length.chr}\x00#{msg2}"
  s.send(pkt2,0)
  puts pkt2
  s.close()
  sleep(0.1)
end

push("KEY_MENU")