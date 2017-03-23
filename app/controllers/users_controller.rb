class UsersController < Clearance::UsersController

  def edit
    @user = current_user
    byebug
    if @user.update(user_params)
      redirect_to root_path
    else
      redirect_to user_path(@user)
    end
  end

  def show
    @user = current_user
  end
end
