require("spec_helper")

describe(Client) do
  describe("#name") do
    it "returns a name" do
      test_client = Client.new({:name => "Meaghan", :stylist_id => 1, :id => nil})
      expect(test_client.name()).to eq("Meaghan")
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      client = Client.new({:name => "Janet", :stylist_id => 1, :id => nil})
      client.save()
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it "empty at first" do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it "lets the user save clients to the database" do
      client = Client.new({:name => "Sonja", :stylist_id => 1, :id => nil})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#==") do
    it "is the same client if it has the same name" do
      client1 = Client.new({:name => "Sonja", :stylist_id => 1, :id => nil})
      client2 = Client.new({:name => "Sonja", :stylist_id => 1, :id => nil})
      expect(client1).to(eq(client2))
    end
  end

  describe(".find") do
    it "returns a client by its ID" do
      test_client = Client.new({:name => "Eduardo", :stylist_id => 1, :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Edu", :stylist_id => 1, :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe("#delete") do
    it "lets the user delete a client from the database" do
      client = Client.new({:name => "Miruna", :stylist_id => 1, :id => nil})
      client.save()
      client2 = Client.new({:name => "Anna", :stylist_id => 1, :id => nil})
      client2.save()
      client.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end

  describe("#update") do
    it "lets the user update clients in the database" do
      client = Client.new({:name => "Sonja", :stylist_id => 1, :id => nil})
      client.save()
      client.update({:name => "Andrea"})
      expect(client.name()).to(eq("Andrea"))
    end
  end

end
