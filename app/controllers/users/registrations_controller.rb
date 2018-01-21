class Users::RegistrationsController < Devise::RegistrationsController
  def update
    change_password = true
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      account_update_params = params.require(:user).permit(
        :forename,
        :surname,
        :website,
        :bio,
        :dob,
        :email
      )
      change_password = false
    end

    @user = User.find(current_user.id)
    is_valid = false

    if change_password
      is_valid = @user.update_with_password(account_update_params)
    else
      is_valid = @user.update_without_password(account_update_params)
    end

    if is_valid
      set_flash_message :notice, :updated
      sign_in @user, bypass: true
      render "edit"
    else
      render "edit"
    end
  end

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
