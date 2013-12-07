module FfcrmApi::V1
  class AuthController < FfcrmApi::V1::EntitiesController
    def get_single_access_token
      if params[:email] && user = User.find_by_email(params[:email])
        password = "#{params[:password]}#{user.password_salt}"
        if user.crypted_password == Authlogic::CryptoProviders::Sha512.encrypt(password)
          render json: { :single_access_token => user.single_access_token }
        else 
          head 400
          render :nothing => true
        end
      else
        head 400
        render :nothing => true
      end
    end
  end
end