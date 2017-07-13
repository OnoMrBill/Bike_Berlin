FactoryGirl.define do

  factory :comment do
  	user_id 			  99
  	body        	  "test comment"
  	rating    		  3
  	product_id   	  1
    user
    product
  end

end