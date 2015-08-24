require 'rails_helper'

  describe Payment do
  	it "is valid with payment_amount" do
  		payment = create(:payment)
  		expect(payment).to be_valid
  	end
end

