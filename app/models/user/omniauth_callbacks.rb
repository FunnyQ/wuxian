class User
  module OmniauthCallbacks
    ['facebook'].each do |provider|
      define_method "find_or_create_for_#{provider}" do |response|


        uid = response["uid"]
        data = response["info"]
        user = nil
        authorization = Authorization.where(:provider => provider, :uid => uid).first

        if authorization

          # 使用者已經是本站註冊用戶並已經綁定第三方服務。
          # 所以直接登入
          user = authorization.user
        else

          # 使用者已經是本站註冊用戶，但尚未綁定此第三方服務。
          # 找出使用相同 email 的使用者
          user = User.find_by_email(data["email"])
          if user

            # 如果有，則登入並為此使用者綁定本第三方服務
            user.bind_service(response)
          else

            # 若沒有，則應該是個新使用者，透過第三方服務進行登入
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

      # 使用者名稱重複的話，用時間參數當作使用者名稱
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
