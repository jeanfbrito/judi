class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)

      @requested_info = request.env["omniauth.auth"].extra.raw_info

      #raise @requested_info.to_yaml

      @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"

        #updates the db info
        @user.name = @requested_info.name
        @user.first_name = @requested_info.given_name
        @user.last_name = @requested_info.family_name
        @user.picture = @requested_info.picture
        @user.gender = @requested_info.gender

        #raise @user.to_yaml
        
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end
end