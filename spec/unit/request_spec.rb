describe Paperback::Request do
  context "assembling a path" do
    it "should strip repeated slashes" do
      client.assemble_path("//api/auth_user").should eq("/api/auth_user")
    end
  end

  context "building a resource path" do
    it "should assemble the path with query parameters" do
      client.resource_builder("api/auth_user", :parameter1 => "me", 
                             :parameter2 => true).should eq("/api/auth_user?parameter1=me&parameter2=true")
    end
  end
end
