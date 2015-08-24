require 'rails_helper'

  describe User do
  	it "is valid with email a user income" do
  		user = create(:user)
  		expect(user).to be_valid
  	end


  	# Testing validations


  	it "is valid without a firstname" do
  		user = create(:user, first_name: nil)
  		expect(user).to be_valid
  	end

  	it "is valid without a lastname" do
  	  	user = create(:user, last_name: nil)
  		expect(user).to be_valid
  	end

  	it "is valid without a client income" do
  	  	user = create(:user, client_income: nil)
  		expect(user).to be_valid
   	end
 
end

