require 'rails_helper'

describe 'Admin can edit bank feature' do
  let!(:admin) { create :admin }
  let!(:bank) { create :bank }

  before { login_as admin }

  it 'allows admin to update bank' do
    visit admin_path

    click_on 'View all Banks'

    find("[data-test=bank-edit-#{bank.id}]").click

    expect(page).to have_content "Edit Bank ##{bank.id}"

    fill_in 'Name', with: bank.name

    click_on 'Edit'

    expect(page).to have_content 'Bank has been updated successfully.'
  end
end
