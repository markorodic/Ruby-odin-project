require 'socket'

server = TCPServer.open(2000)
loop {
	request = "GET #{path} HTTP/1.1\r\n\r\n"
	client = server.accept
	client.puts(Time.now.ctime)
	if 
	client.puts "Closing the connection. Bye!"
	client.close
}