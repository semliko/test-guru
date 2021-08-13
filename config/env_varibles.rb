if Rails.env.development?
  ENV['git_hub_token'] = Rails.application.credentials.config[:git_hub][:git_hub_token]
end

