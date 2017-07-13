FactoryGirl.define do
	
  factory :user do
  	sequence(:email) { |n| "user_#{n}@testing.com" }
    # email 			"user_6@testing.com"
    password 			"testing"
    first_name 		"Joe"
    last_name 		"Bloggs"
    admin 				false

    factory :admin do
    	email				"bill.fennell@gmail.com"
    	password		"password"
    	first_name 	"Bill"
    	last_name 	"Fennell"
      admin 			true
    end
  end

  # example of using Inheritance:
	# factory :post do
	#   title "A title"
	# end

	# factory :approved_post, parent: :post do
	#   approved true
	# end  

end
