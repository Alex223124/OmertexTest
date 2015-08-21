class Loan
  include Mongoid::Document
  include Mongoid::Enum

  enum :status, [:pending, :approved, :refused], default: :pending 


  # Loan.statuses
  def self.statuses
    self::STATUS
  end





  # Data
  field :loan_name,   type: String #Генерируется случайно
  field :loan_amount, type: Integer #По дефолту исходя из юзера


  #Как будт ясен синтаксис ассоциаций
  #def loan
  #	"Borrower " + loan.user + "." + " Registred: " + Time.now.to_s
  #end


end
