class Loan
  include Mongoid::Document
  include Mongoid::Enum

  enum :status, [:pending, :approved, :refused], default: :pending 


  # Loan.statuses
  def self.statuses
    self::STATUS
  end

  #Active Record Assc analog
  # has_many :percentage_of_loans
  # belongs_to :user
  # has_many :payments

  
  # Validations
  # validates: loan_amount, numericality: { greater_than: 100, 
                                          # less_than_or_equals_to: 500000 }


  # Custom Validations
  #  validate :initial_day_is_in_future
  #  validate :last_day_is_in_future

  #  def initial_day_is_in_future
   #   if initial_day < Time.now
    #    errors.add( :initial_day, "can't be in the past")
     # end
    # end

    #def last_day_is_in_future
     # if last_day < Time.now
      #  errors.add( :last_day, "can't be in the past")
     # end
    #end


  # Data
  field :loan_name,   type: String #Генерируется случайно
  field :loan_amount, type: Integer #Выбираемое юзером количетсво денег которое он берёт в кредит

  field :initial_day, type: Time #Нужно выбрать юзеру
  field :last_day ,   type: Time #Нужно выбрать юзеру

  filed :description, type: String #Почему выбрали наш банк?


  #Проценз устанавливается на день 5% в день или 10% в день
  #соотвтетсвенно в формуле нам нужен метод которые постчитает разницу во времени.



  #Как будт ясен синтаксис ассоциаций
  #def loan
  #	"Borrower " + loan.user + "." + " Заявка Registred: " + Time.now.to_s
  #end


end
