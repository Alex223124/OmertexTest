class Payment
  include Mongoid::Document

  # Active Record Assc Analog
  # belongs_to :user
  # belong_to :loan

  # валидации, не меньше 10$ за раз
  # validates :payment_amount, numericality: { greater_than 10,
  											 # less_than_or_equal_to: 500000 }



  # Data
  field :payment_name,      type: String    #название генерируется автоматически
  field :payment_amount,    type: Integer   #выбирется юзером
  
end
