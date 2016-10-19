require "../../rails_helper"
RSpec.describe 'deleting a secret' do
  before do
    @user = create_user
    log_in @user
    fill_in 'content', with: "guess what?"
    click_on 'Submit Secret'
    expect(page).to have_text('guess what?')
  end
  it 'deletes secrets -- profile page' do
    click_on 'Delete'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('guess what?')
  end
  it 'allows users to delete their secrets from the index page' do
    visit "/secrets"
    click_on 'Delete'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('guess what?')
  end
end
