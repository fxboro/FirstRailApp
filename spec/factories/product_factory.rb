FactoryBot.define do

	sequence(:id) { |n| "#{n}" }

  factory :product do
  	id
  	name 					"mountain test bike"
  	description 	"FactoryBot test description"
  	image_url 		"testbike.jpg"
  	colour 				"black"
  	price 				"99.99"
  end

end
