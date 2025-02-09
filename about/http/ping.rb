require 'test/unit'
require_relative './server'
require 'net/http'
require 'json'

class PingTest < Test::Unit::TestCase

  def setup
    @server = Server.new(5001, { "alive" => true })
    Thread.new { 
      @server.start 
    }
    @uri = URI('http://localhost:5001')
  end

  def teardown
  end

  def test_ping
    response = Net::HTTP.get_response(@uri)
    answer = JSON.parse(response.body)

    assert_equal(answer, { "alive" => true })
  end

  
end