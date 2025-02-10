require 'test/unit'
require_relative './server'
require 'net/http'
require 'json'

class PingTest < Test::Unit::TestCase

  def setup
    @server = Server.new(5001, ->(form) { {"alive" => true} } )
    @server_thread = Thread.new {  @server.listen_once }
    @uri = URI("http://localhost:#{@server.port}")
  end

  def teardown
    @server_thread.exit
  end

  def test_answer_set_at_initialization
    response = Net::HTTP.get_response(@uri)
    answer = JSON.parse(response.body)

    assert_equal(answer, { "alive" => true })
  end

  def test_answer_set_later
    @server.answer = ->(form) { { "message" => "hello world" } }
    response = Net::HTTP.get_response(@uri)
    answer = JSON.parse(response.body)

    assert_equal(answer, { "message" => "hello world" })
  end

  def test_dynamic_answer
    @server.answer = ->(form) { { incoming:form } }
    response = Net::HTTP.post_form(@uri, 'one' => 1, 'two' => '2' )
    answer = JSON.parse(response.body)

    assert_equal(answer, { "incoming" => "one=1&two=2" })
  end
  
end