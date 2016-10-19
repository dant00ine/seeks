require "../../rails_helper"
RSpec.describe 'new secret page' do
  it 'has form on profile page for new secret'do
    user = create_user
    log_in user
    expect(page).to have_field('content')
  end
end
