require 'rails_helper'

describe Product do

  before do
      @product = Product.create(name: "Race Bike", description: "nice", color: "red", price: 99)
      @user = Use.create(first_name: "Chima", last_name: "Ohiagbaji", email: "user@gmail.com", password: "123abc")
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of the comments" do
      expect(@product.average_rating).to eq 3
 end

      it "is not valid without a name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
end
