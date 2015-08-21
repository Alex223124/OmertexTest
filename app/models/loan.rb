class Loan
  include Mongoid::Document
  include Mongoid::Enum

  enum :status, [:pending, :approved, :refused], default: :pending 

  def self.statuses
    self::STATUS
  end



  # Data
  field :loan_name,   type: String 
  field :loan_amount, type: Integer

end
