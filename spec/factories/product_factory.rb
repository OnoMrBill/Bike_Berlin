FactoryGirl.define do

	sequence(:id) { |n| "#{n}" }

  factory :product do
  	id
  	name 					"fabulous test bike"
  	description 	"FactoryGirl test description"
  	image_url 		"testbike.jpg"
  	colour 				"blue"
  	price 				"99.99"
  end

end
