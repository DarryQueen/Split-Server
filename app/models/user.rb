class User < ActiveRecord::Base
  attr_accessible :email, :name, :authentication_token
  has_many :memberships
  has_many :meals, :through => :memberships

  def generate_authentication_token
    while self.authentication_token.nil? or self.class.exists?(:authentication_token => authentication_token)
      self.authentication_token = SecureRandom.hex
    end

    self.save!

    authentication_token
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      # Get the existing user by email.
      email = auth.info.email
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration.
      if user.nil?
        user = User.new(
          :email => email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          :name => auth.info.name
        )
        user.skip_confirmation! if user.respond_to?(:skip_confirmation)
        user.save!
      end
    end

    # Associate the identity with the user if needed.
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
end
