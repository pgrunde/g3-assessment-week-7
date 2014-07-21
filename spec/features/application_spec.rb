require 'spec_helper'

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
  end

  scenario 'Displays message add feature' do
    visit '/'

    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Message:'
    expect(page).to have_button 'Add Message'
  end

  scenario 'click "Add Message" on root to submit a message' do
    visit '/'

    fill_in "name", :with => "peter"
    fill_in "message", :with => "The pies in the sky are dry"
    click_button "Add Message"

    expect(page).to have_content 'peter'
    expect(page).to have_content 'The pies in the sky are dry'
  end

  scenario 'click on a continent to see the appropriate countries listed' do
    visit '/continents'

    click_link 'Africa'
    expect(page).to have_content 'South Africa'
    expect(page).to have_content 'Kenya'

    visit '/continents'

    click_link 'Europe'
    expect(page).to have_content 'Italy'
    expect(page).to have_content 'Spain'
    expect(page).to have_content 'France'

    visit '/continents'

    click_link 'North America'
    expect(page).to have_content 'United States of America'
    expect(page).to have_content 'Canada'
    expect(page).to have_content 'Mexico'

    visit '/continents'

    click_link 'South America'
    expect(page).to have_content 'Venezuela'
    expect(page).to have_content 'Colombia'
    expect(page).to have_content 'Argentina'
  end

end