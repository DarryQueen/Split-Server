class SessionsController < RocketPants::Base
  def create
    user = User.find_for_oauth(auth_hash)
    user.generate_authentication_token

    expose({
      :user_id => user.id,
      :token => user.authentication_token
    })
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
