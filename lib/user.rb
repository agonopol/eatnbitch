module EatNBitch
  class User < Sequel::Model
    many_to_many :dish
    one_to_many :review
  end

  def self.register(params)
  	
  end
  
end