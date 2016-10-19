require '../../rails_helper'
RSpec.describe 'user::create' do
  before do
    visit 'users/new'
  end
  it "has a working form for user creation" do
    fill_in "user_email", with: "maddad40@hotmail.com"
    fill_in "user_name", with: "RT"
    fill_in "user_password", with: "tttt"
    fill_in "user_password_confirmation", with: "tttt"
    click_button "Create User"
    @user = User.last
    expect(current_path).to eq("/users/#{@user.id}")
  end
  it "shows validation errors" do
    click_button "Create User"
    expect(current_path).to eq('/users/new')
    expect(page).to have_text("can't be blank")
    expect(page).to have_text("invalid")
  end
end
