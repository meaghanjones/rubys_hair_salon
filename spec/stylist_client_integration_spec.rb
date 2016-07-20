require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new salon', {:type => :feature}) do
  it "allows a user to add a new stylist to the list" do
    visit('/')
    fill_in('stylist_name', :with => 'Ruby')
    click_button('Add Stylist')
    expect(page).to have_content('Success')
  end
end

  describe('deleting a new salon', {:type => :feature}) do
    it "allows a user to delete a stylist on the list" do
    stylist = Stylist.new({:name => "Meaghan", :id => nil})
    stylist.save()
    stylist2 = Stylist.new({:name => "Edu", :id => nil})
    stylist2.save()
    visit('/')
    click_button('Delete Stylist')
    click_link('Return Home')
    expect(page).to have_content(stylist2.name())
  end
end
