module EatNBitch
  class Dish < Sequel::Model
    one_to_many :review
    many_to_many :restaurant
    many_to_many :user
  end
  
end