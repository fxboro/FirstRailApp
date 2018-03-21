FactoryBot.define do

	sequence(:id) { |n| "#{n}" }

  factory :product do
  	id
  	name 					"Atlas bike"
  	description 	"FactoryBot test description"
  	image_url 		"testbike.jpg"
  	colour 				"black"
  	price 				"99.99"
  end

end
