Rails.application.config.middleware.use OmniAuth::Builder do
  provider :venmo, ENV['venmo_public_key'], ENV['venmo_private_key'], :scope => 'access_email,access_phone,access_friends,make_payments'
end
