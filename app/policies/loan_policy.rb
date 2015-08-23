class LoanPolicy

	attr_reader :current_user, :model 

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	# Админ может просматривать список всех кредитов юзера
	# Юзер может просматривать список всех своих кредитов
	def index?
		@current_user.admin? || @current_user == @user
	end

	# Только юзер может создавать новые кредиты
	def new?
		@current_user == @user
	end

	def create?
		@current_user == @user
	end

	# Админ может просматривать данные кредита юзера
	# Юзер может просматривать данные своего кредита
	def show?
		@current_user.admin? || @current_user == @user
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