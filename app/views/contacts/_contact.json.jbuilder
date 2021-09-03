json.extract! contact, :id, :name, :email, :message, :new, :create, :created_at, :updated_at
json.url contact_url(contact, format: :json)
