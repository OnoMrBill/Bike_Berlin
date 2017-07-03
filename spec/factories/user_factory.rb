FactoryGirl.define do
  factory :user do
  	sequence(:email) { |n| "user_#{n}@example.com" }
    # email "blah6@email.com"
    password "testing"
    first_name "John"
    last_name "Example"
    admin false
  end

	factory :admin, class: User do
	  # email "admin@example.com"
	  email
	  password "qwertyuiop"
	  admin true
	  first_name "Admin"
	  last_name "User"
	end

  # example of using Inheritance:
	# factory :post do
	#   title "A title"
	# end

	# factory :approved_post, parent: :post do
	#   approved true
	# end  

end
