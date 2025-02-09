require 'socket'

class Server
    
    def initialize(port, answer)
        @body = answer.to_json
        @port = port
        @server = TCPServer.new port
        puts 'Server created on port ' + @port.to_s
    end
    def start
        puts 'Server is listening...'
        while session = @server.accept
            request = session.gets
            puts request

            unless request.nil?
                session.print "HTTP/1.1 200\r\n"
                session.print "Content-Type: application/json\r\n"
                session.print "Content-Length: " + @body.length.to_s + "\r\n"
                session.print "\r\n"
                session.print @body
            end
            session.close
        end
    end
end