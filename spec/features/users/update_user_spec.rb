require "../../rails_helper"
RSpec.describe 'user::update' do
  it 'updates user and redirects to profile page' do
    user = create_user
    log_in user
    expect(page).to have_text("Chris")
    click_link 'Edit Profile'
    fill_in 'user_email', with: "kobe123@lakers.com"
    click_button 'Update User'
    expect(page).not_to have_text('cd@123.com')
    expect(page).to have_text('kobe123@lakers.com')
  end
end
