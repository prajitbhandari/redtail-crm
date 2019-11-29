require 'rails_helper'

describe 'login to REDTRAIL CRM', js: true do

  it 'with valid dummy inputs' do
    #expect(1).to eq 1
    visit 'https://dev.accounts.redtailtechnology.com/?Product=leapfrog&ReturnURL=http://dev.otw.redtailtechnology.com/login'
    # fill_in 'session_username', with: 'danphe'
    # fill_in 'session_password', with: 'qB96L%tcf%MO'
    # click_button 'Sign In'
    # visit 'https://dev.otw.redtailtechnology.com/contacts/individuals/new'
  end
  # scenario 'with empty username and password ' do
  #   visit 'https://dev.accounts.redtailtechnology.com/?Product=leapfrog&ReturnURL=http://dev.otw.redtailtechnology.com/login'
  #   fill_in 'session_username', with: ''
  #   fill_in 'session_password', with: ''
  #   click_button 'Sign In'
  #   expect(page).to have_text("Username and Password can't be blank")
  # end
  # scenario 'with invalid username and password ' do
  #   visit 'https://dev.accounts.redtailtechnology.com/?Product=leapfrog&ReturnURL=http://dev.otw.redtailtechnology.com/login'
  #   fill_in 'session_username', with: 'dsfsfhas'
  #   fill_in 'session_password', with: 'sdfasdfsa'
  #   click_button 'Sign In'
  #   # expect(page).to have_text("Invalid Username and Password")
  # end
end