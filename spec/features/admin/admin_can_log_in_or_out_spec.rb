require 'rails_helper'

describe 'Admin can log in/out feature' do
  let!(:admin) { create :admin }

  it 'allows admin to log in/out' do
    visit admin_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: '123123123'

    click_on 'Log in'

    expect(page).to have_content "Welcome, #{admin.email}!"
    click_on 'Sign out'

    expect(page).to have_content 'Signed out successfully.'
  end
end
