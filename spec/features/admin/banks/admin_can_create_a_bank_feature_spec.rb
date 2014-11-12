require 'rails_helper'

describe 'Admin can create a bank feature' do
  let!(:admin) { create :admin }
  let!(:bank) { create :bank }

  before { login_as admin }

  it 'Allow admin create a bank' do
    visit admin_path

    click_on 'View all Banks'
    click_on 'Create Bank'

    fill_in 'Name', with: bank.name

    click_on 'Create'

    expect(page).to have_content 'Bank has been created successfully.'
    expect(page).to have_content bank.name
  end
end
