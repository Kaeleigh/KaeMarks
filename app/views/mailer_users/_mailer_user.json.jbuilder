json.extract! mailer_user, :id, :name, :email, :login, :created_at, :updated_at
json.url mailer_user_url(mailer_user, format: :json)
