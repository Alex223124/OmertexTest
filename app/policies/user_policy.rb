class UserPolicy
	attr_reader :current_user, :model 

	def initialize(current_user, model)
		@current_user = current_user
		@user = model
	end

	# Только админ может проматривать список всех юзеров
	def index?
		@current_user.admin?
	end

	# Только админ может создавать юзеров через специальную форму
	def new?
		@current_user.admin?
	end

	def create
		@current_user.admin?
	end

	# Юзер может увидеть данные своего аккаунта, админ может видеть данные юзера
	def show?
		@current_user.admin? || @current_user == @user
	end

	# Только Админ может исправлять регистрационные данные юзера
	def edit?
		@current_user.admin?
	end

	def update?
		@current_user.admin?
	end

	# Только админ может удалять юзера
	def delete?
		@current_user.admin?
	end

	def destroy?
		@current_user.admin?
	end


end