require 'rails_helper' # also requires spec_helper and adds other stuff - if didnt need Rails just use spec_helper but unlikely

describe Product do

  context "when the product has comments" do # create context
      before do # before running the test...
        #@product = Product.create!(:name => "Atlas Bike")
        #@user = User.create(:email => "123@123.com", :password => "12345678" )
        @product = FactoryBot.create(:product)
        @user = FactoryBot.create(:user)
        @product.comments.create!(:rating => 4, :user => @user, :body => "Great Bike")
        @product.comments.create!(:rating => 5, :user => @user, :body => "Awesome Bike")
        @product.comments.create!(:rating => 5, :user => @user, :body => "Fantastic Bike")
        @product.comments.create!(:rating => 2, :user => @user, :body => "not so fantastic")
      end

      it 'returns the average rating of all comments' do
        expect(@product.average_rating).to eq 4
      end
    end


  end
