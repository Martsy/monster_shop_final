require 'rails_helper'

RSpec.describe 'Add Locale' do
  before :each do
    @user = User.create!(name: 'Martsy', email: 'martsy@icloud.com', password: 'martsys', address: '1610 Little Raven', city: 'Denver', state: 'CO', zip: '80202')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    # @nickname = 'Home'
    # @address = '1610 Little Raven'
    # @city = "Denver"
    # @state = "CO"
    # @zip = '80202'
    visit profile_path
  end

  it 'User can add locale' do
    visit new_profile_locale_path

    fill_in :locale_nickname, with: 'Vacation'
    fill_in :locale_address, with: '1610 Little Raven'
    fill_in :locale_city, with: 'Denver'
    fill_in :locale_state, with: 'CO'
    fill_in :locale_zip, with: '80202'

    click_button 'Submit'

    expect(current_path).to eq(profile_path)

    within '#locale-info' do
      expect(page).to have_content('Vacation')
      expect(page).to have_content('Little Raven')
      expect(page).to have_content('Denver')
      expect(page).to have_content('CO')
      expect(page).to have_content('80202')
    end
  end
end
