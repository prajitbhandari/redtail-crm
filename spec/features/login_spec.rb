require 'rails_helper'
require 'byebug'
describe 'login to REDTRAIL CRM', js: true do

  it 'with valid dummy inputs' do
    is_logged_in?
    is_valid_individual?
    is_valid_family?
    is_valid_spouse?
    is_valid_address?
    is_valid_phone?
    is_valid_email?
    click_button 'Save & New'
    sleep 10
  end
end


def is_logged_in?
   visit 'https://dev.accounts.redtailtechnology.com/?Product=leapfrog&ReturnURL=http://dev.otw.redtailtechnology.com/login'
   fill_in 'session_username', with: 'danphe'
   fill_in 'session_password', with: 'qB96L%tcf%MO'
   click_button 'Sign In'
   visit 'https://dev.accounts.redtailtechnology.com/subscriptions/trial?Product=leapfrog&ReturnURL=http%3A%2F%2Fdev.otw.redtailtechnology.com%2Flogin'
   click_button 'Proceed to trial'
   visit 'https://dev.otw.redtailtechnology.com/contacts/individuals/new'
end

def is_valid_individual?
   @test_option = find(:css, '#crm_contact_individual_salutation_id').all(:css, 'option').sample
   if @test_option.text == ""
      is_valid_individual?
   else
      @test_option.select_option
      @individual_text = @test_option.text
      fill_in 'crm_contact_individual[first_name]', with: Faker::Name.first_name
      fill_in 'crm_contact_individual[middle_name]', with: Faker::Name.middle_name
      fill_in 'crm_contact_individual[last_name]', with: Faker::Name.last_name
      find(:css, '#crm_contact_individual_suffix').all(:css, 'option').sample.select_option
      fill_in 'crm_contact_individual[nickname]', with: Faker::Name.initials
      fill_in 'crm_contact_individual[designation]', with: Faker::Job.position
      fill_in 'crm_contact_individual[job_title]', with: Faker::Job.title
      fill_in 'crm_contact_individual[business_attributes][company_name]', with: Faker::Company.name
   end
end

def is_valid_family?
   fill_in 'crm_contact_individual[family_member_attributes][family_attributes][name]', with: Faker::Name.last_name
end

def is_valid_spouse?
   @spouse_option = find(:css, '#crm_contact_individual_add_spouse_salutation_id').all(:css, 'option').sample
   @spouse_text = @spouse_option.text
   if @individual_text == "Father" && @spouse_text == "Sister"
      is_valid_spouse?
   else
      @spouse_option.select_option
   end

   sleep 5
   fill_in 'crm_contact_individual[add_spouse][first_name]', with: Faker::Name.first_name
   sleep 5
   fill_in 'crm_contact_individual[add_spouse][middle_name]', with: Faker::Name.middle_name
   sleep 5
   fill_in 'crm_contact_individual[add_spouse][last_name]', with: Faker::Name.last_name
   sleep 5
   find(:css, '#crm_contact_individual_add_spouse_suffix').all(:css, 'option').sample.select_option
   fill_in 'crm_contact_individual[add_spouse][nickname]', with: Faker::Name.initials
   fill_in 'crm_contact_individual[add_spouse][designation]', with: Faker::Job.position
   fill_in 'crm_contact_individual[add_spouse][job_title]', with: Faker::Job.title
   fill_in 'crm_contact_individual[add_spouse][business][company_name]', with: Faker::Company.name
end

def is_valid_address?
   @address_option = find(:css, '#crm_contact_individual_addresses_attributes_0_address_type').all(:css, 'option').sample
   if @address_option.text == ""
      is_valid_address?
   else
      @address_option.select_option
      find('select[id^="country-select-"]').all('option').sample.select_option
      fill_in 'crm_contact_individual[addresses_attributes][0][street_address]', with: Faker::Address.street_name
      fill_in 'crm_contact_individual[addresses_attributes][0][secondary_address]', with: Faker::Address.secondary_address
      fill_in 'crm_contact_individual[addresses_attributes][0][city]', with: Faker::Address.street_name
      fill_in 'crm_contact_individual[add_spouse][first_name]', with: Faker::Address.city
      find('select[id^="state-select-"]').all('option').sample.select_option
      fill_in 'crm_contact_individual[addresses_attributes][0][zip]', with: Faker::Address.postcode
   end
end

def is_valid_phone?
   @phone_option = find(:css, '#crm_contact_individual_phones_attributes_0_phone_type').all(:css, 'option').sample
   if @phone_option.text == "Please select"
      is_valid_phone?
   else
      @phone_option.select_option
      fill_in 'crm_contact_individual[phones_attributes][0][number]', with: Faker::PhoneNumber.cell_phone
      fill_in 'crm_contact_individual[phones_attributes][0][extension]', with: Faker::PhoneNumber.extension
      fill_in 'crm_contact_individual[phones_attributes][0][speed_dial]', with: Faker::PhoneNumber.country_code
   end
end

def is_valid_email?
   @email_option = find(:css, '#crm_contact_individual_emails_attributes_0_email_type').all(:css, 'option').sample
   if @phone_option.text == ""
   else
      @phone_option.select_option
      fill_in 'crm_contact_individual[emails_attributes][0][address]', with: Faker::Internet.email
   end
end


