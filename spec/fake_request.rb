require 'ostruct'

class FakeRequest
  def initialize(verb = :get, content = "")
    @verb = verb
    @content = content
  end

  def post?
    verb == :post
  end

  def body
    OpenStruct.new(read: content)
  end

  private
  attr_reader :verb, :content
end
