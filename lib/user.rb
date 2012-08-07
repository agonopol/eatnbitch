module EatNBitch
  class User < Sequel::Model
    one_to_many :dish
  end
  
end