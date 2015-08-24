require 'rails_helper'

  describe Loan do
  	it "is valid with loan amount and period" do
  		loan = create(:loan)
  		expect(loan).to be_valid
  	end


  	# Testing validations


  	it "is valid without a description" do
  		loan = create(:loan, description: nil)
  		expect(loan).to be_valid
  	end


end
