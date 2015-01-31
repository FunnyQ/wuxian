class User
  module OmniauthCallbacks
    ['facebook'].each do |provider|
      define_method "find_or_create_for_#{provider}" do |response|


        uid = response["uid"]
        data = response["info"]
        user = nil
        authorization = Authorization.where(:provider => provider, :uid => uid).first

        if authorization

          # user already registered and binded at least one oauth provider
          # so let user login directly
          user = authorization.user
        else

          # if user already registered, but never binding any oauth provider
          # find user by same email
          user = User.find_by_email(data["email"])
          if user

            # if there is a user using the same email, login and binding provider
            user.bind_service(response)
          else

            # if there is not, then this should be a new user.
            # log this new user in with oauth and create a new account.
            user = User.new_from_provider_data(provider,uid,data)

            if user.save(:validate => false)
              user.authorizations << Authorization.new(:provider => provider, :uid => uid)
            else
              Rails.logger.warn("3rd-party authentication failed，#{user.errors.inspect}")
            end
          end
        end

        return user

      end
    end

    def new_from_provider_data(provider, _uid, data)
      user = User.new
      user.email = data["email"]
      # user.email = "twitter+#{uid}@example.com" if provider == "twitter"
      # user.email = "douban+#{uid}@example.com" if provider == "douban"

      user.real_name = data["name"] if provider == "facebook"
      # user.name = data["name"] if provider == "google"
      # user.name.gsub!(/[^\w]/, "_")

      # if there is already a user with same real name, using time serial as user real name
      if User.where(:real_name => user.real_name).count > 0 || user.real_name.blank?
        user.real_name = "u#{Time.now.to_i}"
      end

      user.password = Devise.friendly_token[0,20]
      user.location = data["location"]
      # user.tagline = data["description"]

      user
    end
  end
end
