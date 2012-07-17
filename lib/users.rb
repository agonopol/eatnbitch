module EatNBitch
	class User

		attr_accessor :name, :surname, :email

		def initialize(name, surname, email)
			@name = name
			@surname = surname
			@email = email
		end

		def show()
			 {"Name" => @name, "Surname" => @surname, "Where to send spam" => @email }
		end
	end 
		class Users
		def initialize
			@users = []
		end

		def add_user(name, surname, email)
			@users << User.new(name,surname,email)
		end

		def all
			@users.map { |user| "#{user.name}    #{user.surname}   #{user.email}" }
		end
	end

end