require("spec_helper")

describe(Stylist) do
  describe("#name") do
    it "returns a name" do
      test_stylist = Stylist.new({:name => "Chris", :id => nil})
      expect(test_stylist.name()).to eq("Chris")
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Janet", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it "empty at first" do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it "lets the user save stylists to the database" do
      stylist = Stylist.new({:name => "Janice", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it "is the same stylist if it has the same name" do
      stylist1 = Stylist.new({:name => "Janice", :id => 1})
      stylist2 = Stylist.new({:name => "Janice", :id => 2})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it "returns a stylist by its ID" do
      test_stylist = Stylist.new({:name => "Phil", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Philip", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#delete") do
    it "lets the user delete a stylist from the database" do
      stylist = Stylist.new({:name => "Lady Di", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Miss Lady Di", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

  describe("#update") do
    it "lets the user update stylists in the database" do
      stylist = Stylist.new({:name => "Janice", :id => nil})
      stylist.save()
      stylist.update({:name => "Revell"})
      expect(stylist.name()).to(eq("Revell"))
    end
  end

  describe("#clients") do
   it("returns an array of clients for a stylist") do
     stylist = Stylist.new({:name => "Rhonda", :id => nil})
     stylist.save()
     client1 = Client.new({:name => "Meaghan", :stylist_id => stylist.id(), :id => nil})
     client1.save()
     client2 = Client.new({:name => "Sonja", :stylist_id => stylist.id(), :id => nil})
     client2.save()
     expect(stylist.clients()).to(eq([client1, client2]))
   end
 end

end
