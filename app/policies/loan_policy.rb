class LoanPolicy

	attr_reader :current_user, :loan 

	def initialize(current_user, loan)
		@current_user = current_user
		@loan = loan
	end

	# Админ может просматривать список всех кредитов юзера
	# Юзер может просматривать список всех своих кредитов
	def index?
		@current_user.admin? || @current_user
	end

	# Админ может создавать новые кредиты
	# Юзер может создавать новые кредиты
	def new?
		@current_user.admin? || @current_user
	end

	def create?
		@current_user.admin? || @current_user == @loan.user 
	end

	# Админ может просматривать данные кредита юзера
	# Юзер может просматривать данные своего кредита
	def show?
		@current_user.admin? || @current_user == @loan.user
	end

	# Только админ может редактировать данные кредита
	def edit?
		@current_user.admin?
	end

	def update?
		@current_user.admin?
	end

	# Только админ может удалять кредиты
	def delete?
		@current_user.admin?
	end

	def destroy?
		@current_user.admin?
	end


end