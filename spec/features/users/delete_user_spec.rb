require '../../rails_helper'
RSpec.describe 'delete::user' do
  it 'destroys user and redirects to login page' do
    @user = create_user
    log_in @user
    click_on("Edit Profile")
    # find('input[id="Delete Account"]').click
    click_on('Delete Account')
    expect(current_path).to eq('/sessions/new')
  end
end
