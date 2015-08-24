class Payment
  include Mongoid::Document

  belongs_to :loan
  belongs_to :user


  validates :payment_amount, numericality: { greater_than: 10,
  	                                         less_than_or_equal_to: 500000 }



  # Data
  field :payment_name,      type: String    #название генерируется автоматически
  field :payment_amount,    type: Integer   #выбирется юзером
  field :description,       type: String 
  
end