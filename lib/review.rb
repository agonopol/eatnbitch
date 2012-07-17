module EatNBitch
	class Review

		attr_accessor :text, :user, :date

		def initialize(text, user)
			@text = text
			@user = user
			@date = DateTime.now()	
		end

		def show()
			 {"user"=>@user, "text" => @text }
		end	
	end

	class Reviews
		def initialize
			@reviews = []
		end

		def add_review(text, user)
			@reviews << Review.new(text,user)
		end

		def all
			@reviews.map { |review| "#{review.user}: #{review.text}\n #{DateTime.now}" }
		end
	end

end


