require "../../rails_helper"
RSpec.describe 'user::edit' do
  it 'displays prepopulated form' do
    @user = create_user
    log_in @user
    click_link 'Edit Profile'
    expect(find_field('user_name').value).to eq(@user.name)
    expect(page).to have_field('user_name')
  end
end
