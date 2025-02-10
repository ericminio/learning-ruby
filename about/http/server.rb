require 'socket'

class Server

    attr_accessor :answer
    
    def initialize(port, answer)
        @answer = answer
        @port = port
        @server = TCPServer.new port
    end
    
    def listen_once
        session = @server.accept
        request = session.gets
        incoming = read_body(session)              
        unless request.nil?
            body = @answer.(incoming).to_json
            session.print "HTTP/1.1 200\r\n"
            session.print "Content-Type: application/json\r\n"
            session.print "Content-Length: " + body.length.to_s + "\r\n"
            session.print "\r\n"
            session.print body
        end
        session.close    
        @server.close
        sleep(0.15)
    end

    def read_body(socket)
      content_length = 0
      while (line = socket.gets)
        break if line.strip.empty?
        key, value = line.split(': ', 2)
        content_length = value.to_i if key == 'Content-Length'        
      end
      return unless content_length > 0
      socket.read(content_length)
    end
end