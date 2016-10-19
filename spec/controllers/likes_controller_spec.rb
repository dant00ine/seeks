require "../rails_helper"
RSpec.describe LikesController, type: :controller do
  before do
    @user = create_user
    @secret = @user.secrets.create(content: "hey lala")
  end
  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access create" do
      post :create
      expect(response).to redirect_to('/sessions/new')
    end
    it "cannot access destroy" do
      post :destroy #might need ID here depending on how you set up likes#destroy
      expect(response).to redirect_to('/sessions/new')
    end
  end
  describe "when signed in as the wrong user" do
    it "does not allow the destruction of others' likes" do
      @wrong_user = create_user "swiper", "swiper@explorer.com"
      session[:user_id] = @wrong_user.id
      Like.create(user: @user, secret: @secret)

      delete :destroy, id: @wrong_user.id, secret_id: @secret
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
  end
end
