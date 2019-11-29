require 'rails_helper'

describe 'login to REDTRAIL CRM', js: true do

  it 'with valid dummy inputs' do
     visit 'https://dev.accounts.redtailtechnology.com/?Product=leapfrog&ReturnURL=http://dev.otw.redtailtechnology.com/login'
     fill_in 'session_username', with: 'danphe'
     fill_in 'session_password', with: 'qB96L%tcf%MO'
     click_button 'Sign In'
       visit 'https://dev.accounts.redtailtechnology.com/subscriptions/trial?Product=leapfrog&ReturnURL=http%3A%2F%2Fdev.otw.redtailtechnology.com%2Flogin'
       click_button 'Proceed to trial'
     while true do
       visit 'https://dev.otw.redtailtechnology.com/contacts/individuals/new'

       find(:css, '#crm_contact_individual_salutation_id').all(:css, 'option')[1 + rand(18)].select_option
       fill_in 'crm_contact_individual[first_name]', with: Faker::Name.first_name
       fill_in 'crm_contact_individual[middle_name]', with: Faker::Name.middle_name
       fill_in 'crm_contact_individual[last_name]', with: Faker::Name.last_name
       find(:css, '#crm_contact_individual_suffix').all(:css, 'option')[1 + rand(6)].select_option
       fill_in 'crm_contact_individual[nickname]', with: Faker::Name.initials
       fill_in 'crm_contact_individual[designation]', with: Faker::Job.position
       fill_in 'crm_contact_individual[job_title]', with: Faker::Job.title
       fill_in 'crm_contact_individual[business_attributes][company_name]', with: Faker::Company.name

       fill_in 'crm_contact_individual[family_member_attributes][family_attributes][name]', with: Faker::Name.last_name

       find(:css, '#crm_contact_individual_add_spouse_salutation_id').all(:css, 'option')[1 + rand(18)].select_option
       fill_in 'crm_contact_individual[add_spouse][first_name]', with: Faker::Name.first_name
       fill_in 'crm_contact_individual[add_spouse][middle_name]', with: Faker::Name.middle_name
       fill_in 'crm_contact_individual[add_spouse][last_name]', with: Faker::Name.last_name
       find(:css, '#crm_contact_individual_add_spouse_suffix').all(:css, 'option')[1 + rand(6)].select_option
       fill_in 'crm_contact_individual[add_spouse][nickname]', with: Faker::Name.initials
       fill_in 'crm_contact_individual[add_spouse][designation]', with: Faker::Job.position
       fill_in 'crm_contact_individual[add_spouse][job_title]', with: Faker::Job.title
       fill_in 'crm_contact_individual[add_spouse][business][company_name]', with: Faker::Company.name
     end
  end
end
