require 'spec_helper'

describe Paperback::Client do
  context "truthiness" do
    it "should be true if true" do
      true.should be(true)
    end
  end
end
