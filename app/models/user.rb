class User
  include Mongoid::Document
  include Mongoid::Enum
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  enum :role, [:user, :admin], default: :user 

  # User.roles 
  def self.roles
    self::ROLE
  end

  
  # Hooks
  before_save { self.email = email.downcase }     
                                         
  

  # Associations
  has_many :loans 
  has_many :payments
  
  # Active Record assc analog
  #has_many :loans
  #has_many :payments

  

  # Validations
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                format: { with: VALID_EMAIL_REGEX },
                                uniqueness: { case_sensitive: false }
 
  validates :password, length: {minimum: 6}       
  

  #Валидация ассоциаций
  validates_associated :loans, :payments




  # Концепция %-й ставки за год
    # Если доход от 100 до 1500$ до % кредита
    # Если доход больше либо равно 1501 и меньше либо равно 5000 то % кредита такой-то
    # Есди доход больше либо равно 5001 $ и меньше либо равно 100 000 000 то % кредита такой-то    
  def self.loan_rate_for_year(client_income)
    x = client_income 
    if x >= 100 && x <= 1500
      puts 0.3
    elsif x >= 1501 && x <= 5000
      puts 0.2
    elsif x >= 5001 && x <= 100000000
      puts 0.1
    else
      puts "Error, Your income must be more than 100$ per month"
    end
  end




  # Data
  field :user_name,   type: String, default: "" 
  field :first_name,  type: String, default: ""
  field :last_name,   type: String, default: ""

  field :client_income, type: Integer 

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time


end
