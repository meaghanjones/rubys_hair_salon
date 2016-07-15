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
