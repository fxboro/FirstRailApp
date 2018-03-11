require 'rails_helper'

describe UsersController, type: :controller do

  before do
    #@user1 = FactoryGirl.create(:user)
    @user = User.create!(first_name: "Jonny", last_name: "Gallen", email: "jong@gmail.com", password: "567891", admin: true)
  end

  describe "GET #show" do
     context "when user is logged in" do
       before do
         sign_in @user
       end

       it "loads the correct user details" do
         #get :show, id: @user.id
         get :show, params: { id: @user1.id }
         expect(response.status).to eq 200
         expect(assigns(:user)).to eq @user
       end

       it "doesn't load the second user" do
         get :show, id: @user2.id
         expect(response.status).to eq 302
         expect(response).to redirect_to(root_path)
       end
     end
   end

  end
