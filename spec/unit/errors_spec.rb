describe Paperback::Errors do
  context ".raise_error_for_status" do
    it "should raise no error for a 200..299 status" do
      Paperback::Errors.raise_error_for_status!(200, "")
      Paperback::Errors.raise_error_for_status!(201, "")
      Paperback::Errors.raise_error_for_status!(299, "")
    end

    it "should raise a status from the map when there is a match" do
      expect { 
        Paperback::Errors.raise_error_for_status!(401, "") 
      }.to raise_error(Paperback::Errors::AuthenticationFailureError)
    end

    it "should raise a generic error when status in 200..299 range" do
      expect { 
        Paperback::Errors.raise_error_for_status!(504, "") 
      }.to raise_error(Paperback::Errors::ClientError)
    end
  end
end
