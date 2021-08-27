if Rails.env.development?
  ENV['git_hub_token'] = Rails.application.credentials.config[:git_hub][:git_hub_token]
end

if Rails.env.production?
  ENV["SECRET_KEY_BASE"] = Rails.application.credentials[:secret_key_base]
  ENV['git_hub_token'] = Rails.application.credentials.git_hub[:git_hub_token]
  ENV['SMTP_USERNAMNE'] = Rails.application.credentials.gmail[:gmail_username]
  ENV['SMTP_PASSWORD'] = Rails.application.credentials.gmail[:gmail_password]
end


