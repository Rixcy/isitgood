class Users::RegistrationsController < Devise::RegistrationsController

  private
    def sign_up_params
      params.require(:user).permit(
        :forename,
        :surname,
        :dob,
        :email,
        :password,
        :password_confirmation
      )
    end

    def account_update_params
      params.require(:user).permit(
        :forename,
        :surname,
        :website,
        :bio,
        :dob,
        :email,
        :password,
        :password_confirmation,
        :current_password
      )
    end
end
