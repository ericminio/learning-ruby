require 'test/unit'
require_relative './server'
require 'net/http'
require 'json'

class PortTest < Test::Unit::TestCase

  def setup
    
  end

  def teardown
    
  end

  def test_can_pick_next_available_port
    port = 6001
    TCPServer.new port
    
    begin
        TCPServer.new port
    rescue Errno::EADDRINUSE
        TCPServer.new port + 1
    end
  end

  def test_server_uses_next_available_port
    port = 6005
    TCPServer.new port

    server = Server.new(port, nil)
    assert_equal(server.port, 6006)
  end
  
end