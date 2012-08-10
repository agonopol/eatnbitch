module EatNBitch
  class Restaurant < Sequel::Model
    many_to_many :dish
    one_to_many :review
  end
  
end