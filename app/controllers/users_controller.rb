class UsersController < Clearance::UsersController
  def create
    @user = user_from_params
    sign_in @user if @user.save
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
