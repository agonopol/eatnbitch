module EatNBitch
  class Review < Sequel::Model
    many_to_one :dish
    many_to_one :user
    many_to_one :restaurant
  end
  
end