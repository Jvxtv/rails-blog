class UsersController < Clearance::UsersController
  def create
    @user = user_from_params
    if @user.save
      redirect_with_success
    else
      redirect_with_error
    end
  end

  private

  def redirect_with_error
    flash[:error] = 'Invalid email or password'
    redirect_to root_path
  end

  def redirect_with_success
    flash[:success] = 'Account created successfully'
    sign_in @user
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
