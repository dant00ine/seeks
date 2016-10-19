require "../../rails_helper"
RSpec.describe 'user::show' do
  before do
    @user = create_user
    log_in @user
  end
  it 'displays user name and edit link' do
    expect(page).to have_text("#{@user.name}")
    expect(page).to have_link('Edit Profile')
  end
end
