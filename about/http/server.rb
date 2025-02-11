require 'socket'

class Server
  attr_accessor :port, :answer

  def initialize(port, answer)
    @answer = answer
    pick_port(port)
    @server_thread = Thread.new { listen_once }
  end

  def listen_once
    session = @server.accept
    incoming = Incoming.new(session)
    unless incoming.path.nil?
      body = @answer.call(incoming).to_json
      session.print "HTTP/1.1 200\r\n"
      session.print "Content-Type: application/json\r\n"
      session.print "Content-Length: #{body.length}\r\n"
      session.print "\r\n"
      session.print body
    end
    session.close
    @server.close
    @server_thread.exit
  end

  def pick_port(port)
    @server =
      begin
        server = TCPServer.new port
        @port = port
        server
      rescue Errno::EADDRINUSE
        port += 1
        retry
      end
  end
end

class Incoming
  attr_accessor :method, :path, :headers, :body

  def initialize(socket)
    @method, @path = socket.gets.split
    @headers = {}
    while (line = socket.gets)
      break if line.strip.empty?

      key, value = line.split(': ', 2)
      @headers[key] = value.strip
    end
    @body = socket.read(headers['Content-Length'].to_i)
  end
end
