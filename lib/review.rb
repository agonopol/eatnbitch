module EatNBitch
	class Review
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

		def show_all
			JSON.dump(@reviews.map { |review| review.show})
		end

	end
end


