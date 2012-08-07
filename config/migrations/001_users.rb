Sequel.migration do
  change do
    
    create_table(:users) do
      primary_key :id
      Bignum :user_id, :index => true, :unique => true
      String :screen_name, :index => true
      String :name
      String :secret
      Boolean :admin
    end
    
    create_table(:dish) do
      primary_key :id
      String :name
      String :description
    end
    
  end
end
