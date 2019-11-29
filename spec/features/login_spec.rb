require 'rails_helper'

describe 'login to REDTRAIL CRM', js: true do

  it 'with valid dummy inputs' do
     visit 'https://dev.accounts.redtailtechnology.com/?Product=leapfrog&ReturnURL=http://dev.otw.redtailtechnology.com/login'
     fill_in 'session_username', with: 'danphe'
     fill_in 'session_password', with: 'qB96L%tcf%MO'
     click_button 'Sign In'
     visit 'https://dev.accounts.redtailtechnology.com/subscriptions/trial?Product=leapfrog&ReturnURL=http%3A%2F%2Fdev.otw.redtailtechnology.com%2Flogin'
     click_button 'Proceed to trial'
     visit 'https://dev.otw.redtailtechnology.com/contacts/individuals/new'
     find(:css, '#crm_contact_individual_salutation_id').all(:css, 'option')[1 + rand(18)].select_option
  end
end

