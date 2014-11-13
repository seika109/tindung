require 'rails_helper'

describe 'Admin can delete a bank feature' do
  let!(:admin) { create :admin }
  let!(:bank) { create_list :bank,2 }

  before { login_as admin }

  it 'allow admin to delete a bank' do
    visit admin_path

    click_on "View all Banks"

    find("[data-test=bank-delete-#{bank.first.id}]").click

    expect(page).not_to have_content bank.first.name
    expect(page).to have_content 'Bank has been deleted successfully.'
  end
end
