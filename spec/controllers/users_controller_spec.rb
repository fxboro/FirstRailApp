require 'rails_helper'

describe UsersController, type: :controller do

  before do
    let(:user){ FactoryGirl.create(:user) }
    let(:user2){ FactoryGirl.create(:user) }

    describe "GET #show" do
     context "when user is logged in" do
       before do
         sign_in @user
       end
     end 

       it "loads the correct user details" do
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
