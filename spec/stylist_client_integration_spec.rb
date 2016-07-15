require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new salon', {:type => :feature}) do
  it "allows a user to add a new stylist to the list"
    visit('/')
    click_link('Add New Stylist')
    fill_in('name', :with => 'Ruby')
    expect(page).to have_content('Success')
  end
end
