require 'test/unit'
require_relative './server'
require 'net/http'
require 'json'

class PingTest < Test::Unit::TestCase

  def setup
    @server = Server.new(5001, { "alive" => true })
    @server_thread = Thread.new {  @server.listen_once }
    @uri = URI('http://localhost:5001')
  end

  def teardown
    @server_thread.exit
  end

  def test_ping
    response = Net::HTTP.get_response(@uri)
    answer = JSON.parse(response.body)

    assert_equal(answer, { "alive" => true })
  end

  def test_modify_answer
    @server.answer = { "message" => "hello world" }
    response = Net::HTTP.get_response(@uri)
    answer = JSON.parse(response.body)

    assert_equal(answer, { "message" => "hello world" })
  end

  
end