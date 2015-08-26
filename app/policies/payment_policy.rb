class PaymentPolicy

	attr_reader :current_user, :payment 

	def initialize(current_user, payment)
		@current_user = current_user
		@payment = payment
	end

	# Администратор может проматривать список платежей пользователя
	# Пользователь может проматривать список всех своих платежей по кредиту(-ам)
	def index?
		@current_user.admin? || @current_user
	end

	# Только пользователь может делать новые платежи
	def new?
		@current_user == @payment.user
	end

	def create?
		@current_user == @payment.user
	end

	# Администратор может проматривать детали конкретного платежа
	# Юзер может просматривать детали конкретного платежи
	def show?
		@current_user.admin? || @current_user == @payment.user
	end

	# Только администратор может редактировать данные сделанного платежа
	def edit?
		@current_user.admin?
	end

	def update?
		@current_user.admin?
	end

	# Только админ может удалять платежи
	def delete?
		@current_user.admin?
	end

	def destroy?
		@current_user.admin?
	end


end