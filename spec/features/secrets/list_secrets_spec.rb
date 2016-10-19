require '../../rails_helper'
RSpec.describe 'user profile page' do
  before do
    @user = create_user
    log_in @user
    @secret1 = @user.secrets.create(content:"feeling blue")
  end
  it "displays a user's secrets on their profile page" do
    secret = @user.secrets.create(content:"I love you")
    visit "/users/#{@user.id}"
    expect(page).to have_text("I love you")
    expect(page).to have_text("#{@secret1.content}")
  end
  it "displays everyone's secrets" do
    @user2 = create_user("Martin Silenus", "msilen@hc.com")
    @secret2 = @user2.secrets.create(content: "I also love yu")
    visit '/secrets'
    expect(page).to have_text(@secret1.content)
    expect(page).to have_text("#{@secret2.content}")
  end
end
