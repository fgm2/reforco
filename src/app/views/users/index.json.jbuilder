json.array!(@users) do |user|
  json.extract! user, :id, :name, :cpf, :scholarity, :fone, :whatsapp, :skype, :addrress, :state, :country, :date_of_birth, :created_at
  json.url user_url(user, format: :json)
end
