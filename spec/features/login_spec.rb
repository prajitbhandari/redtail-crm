require 'rails_helper'
require 'byebug'
describe 'login to REDTRAIL CRM', js: true do

  it 'with valid dummy inputs' do
     visit 'https://dev.accounts.redtailtechnology.com/?Product=leapfrog&ReturnURL=http://dev.otw.redtailtechnology.com/login'
     fill_in 'session_username', with: 'danphe'
     fill_in 'session_password', with: 'qB96L%tcf%MO'
     click_button 'Sign In'
     visit 'https://dev.accounts.redtailtechnology.com/subscriptions/trial?Product=leapfrog&ReturnURL=http%3A%2F%2Fdev.otw.redtailtechnology.com%2Flogin'
     click_button 'Proceed to trial'
     visit 'https://dev.otw.redtailtechnology.com/contacts/individuals/new'
     #------------------------New Individual------------------------
     find(:css, '#crm_contact_individual_salutation_id').all(:css, 'option')[1 + rand(18)].select_option
     fill_in 'crm_contact_individual[first_name]', with: Faker::Name.first_name
     fill_in 'crm_contact_individual[middle_name]', with: Faker::Name.middle_name
     fill_in 'crm_contact_individual[last_name]', with: Faker::Name.last_name
     find(:css, '#crm_contact_individual_suffix').all(:css, 'option')[1 + rand(6)].select_option
     fill_in 'crm_contact_individual[nickname]', with: Faker::Name.initials
     fill_in 'crm_contact_individual[designation]', with: Faker::Job.position
     fill_in 'crm_contact_individual[job_title]', with: Faker::Job.title
     fill_in 'crm_contact_individual[business_attributes][company_name]', with: Faker::Company.name

     #------------------------family------------------------
     fill_in 'crm_contact_individual[family_member_attributes][family_attributes][name]', with: Faker::Name.last_name

     #------------------------spouse------------------------
     find(:css, '#crm_contact_individual_add_spouse_salutation_id').all(:css, 'option')[1 + rand(18)].select_option
     fill_in 'crm_contact_individual[add_spouse][first_name]', with: Faker::Name.first_name
     fill_in 'crm_contact_individual[add_spouse][middle_name]', with: Faker::Name.middle_name
     fill_in 'crm_contact_individual[add_spouse][last_name]', with: Faker::Name.last_name
     find(:css, '#crm_contact_individual_add_spouse_suffix').all(:css, 'option')[1 + rand(6)].select_option
     fill_in 'crm_contact_individual[add_spouse][nickname]', with: Faker::Name.initials
     fill_in 'crm_contact_individual[add_spouse][designation]', with: Faker::Job.position
     fill_in 'crm_contact_individual[add_spouse][job_title]', with: Faker::Job.title
     fill_in 'crm_contact_individual[add_spouse][business][company_name]', with: Faker::Company.name

     #------------------------address------------------------
     #debugger
     while true do
       #find(:css, '#crm_contact_individual_addresses_attributes_0_address_type').all(:css, 'option').sample.select_option
       #find('select[id^="country-select-"]').all('option').sample.select_option
       find('select[id^="state-select-"]').all('option').sample.select_option
     end

       #fill_in 'crm_contact_individual[addresses_attributes][0][secondary_address]', with: Faker::Address.street_name
       #fill_in 'crm_contact_individual[addresses_attributes][0][city]', with: Faker::Address.secondary_address
       #fill_in 'crm_contact_individual[add_spouse][first_name]', with: Faker::Address.city
       #find(:css, '#state-select-7ccf233ba5').all(:css, 'option')[1 + rand(19)].select_option
       #fill_in 'crm_contact_individual[addresses_attributes][0][zip]', with: Faker::Address.postcode

       #------------------------phones ------------------------

     #find(:css, '#crm_contact_individual_phones_attributes_0_phone_type').all(:css, 'option')[1 + rand(7)].select_option
     #  fill_in 'crm_contact_individual[phones_attributes][0][number]', with: Faker::PhoneNumber.cell_phone
     #  fill_in 'crm_contact_individual[phones_attributes][0][extension]', with: Faker::PhoneNumber.extension
     #  fill_in 'crm_contact_individual[phones_attributes][0][speed_dial]', with: Faker::PhoneNumber.country_code

       #------------------------emails------------------------
     #while true do
     #  find(:css, '#crm_contact_individual_emails_attributes_0_email_type').all(:css, 'option')[1 + rand(3)].select_option
     #  fill_in 'crm_contact_individual[emails_attributes][0][address]', with: Faker::Internet.email
     #end
  end
end
