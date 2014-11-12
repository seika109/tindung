require 'rails_helper'

describe 'Admin can view list of banks feature' do
  let(:admin) { create :admin }
  let!(:bank) { create_list :bank,2 }

  before { login_as admin }

  it 'Allow admin to view list of banks' do
    visit admin_path

    click_on "View all Banks"

    expect(page).to have_content 'List of Banks'

    expect(page).to have_content bank.first.name
    expect(page).to have_content bank.second.name
  end
end
