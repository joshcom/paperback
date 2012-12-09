require 'spec_helper'

describe "Paperback" do
  it "should create a new class if options are specified" do
    Paperback.client(:key => "a_key").should_not be(client)
  end

  it "should reuse the existing class if no options are specified" do
    Paperback.client(:key => "a_key").should be(Paperback.client)
  end

  it "should call methods on the client object" do
    client.configuration[:endpoint].should eq("http://www.goodreads.com")
  end
end
