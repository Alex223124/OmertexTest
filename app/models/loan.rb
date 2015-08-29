class Loan
  include Mongoid::Document
  include Mongoid::Enum

  enum :status, [:pending, :approved, :refused], default: :pending

  # Loan.statuses
  def self.statuses
    self::STATUS
  end

  # Assotiations
  has_many :payments
  belongs_to :user
  
  # Validations
  validates :loan_amount, presence: true,
  numericality: { greater_than: 100, less_than_or_equals_to: 500000 }
  validates :period, presence: true

  # Data
  field :loan_name, type: String
  field :loan_amount, type: Integer
  field :percente_rate, type: String
  field :period, type: Integer
  field :description, type: String
end
