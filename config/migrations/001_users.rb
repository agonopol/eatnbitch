Sequel.migration do
  change do
    
    create_table(:users) do
      primary_key :id
      Bignum :user_id, :index => true, :unique => true
      String :login, :index => true
      String :name
      String :secret
      Boolean :admin
      String :sex 
      Integer :age
      Text :bio
      String :city
    end
    
    create_table(:dishes) do
      primary_key :id
      String :name
      String :description
      String :cuisine
    end
    

    create_table(:restaurants) do
      primary_key :id
      String :name
      String :address
      String :city
      String :cuisine
    end


    create_table(:reviews) do
      primary_key :id
      Fixnum :rating
      String :text
    end

  end
end
