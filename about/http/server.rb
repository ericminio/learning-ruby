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
        unless request.nil?
            session.print "HTTP/1.1 200\r\n"
            session.print "Content-Type: application/json\r\n"
            session.print "Content-Length: " + @answer.to_json.length.to_s + "\r\n"
            session.print "\r\n"
            session.print @answer.to_json
        end
        session.close    
        @server.close    
    end
end