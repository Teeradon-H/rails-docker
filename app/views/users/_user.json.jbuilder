json.extract! user, :id, :userId, :password, :email, :name, :email, :address, :address1, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
