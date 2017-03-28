class UsersController < Clearance::UsersController

  def edit
    #user
    @user = current_user
    #superadmin
    @user_role = User.find(params[:id])

    #edit profile user
    if current_user.role == 'user'
      if @user.update(user_params)
        redirect_to root_path
      else
        redirect_to user_path(@user)
      end
    #edit user role by superadmin
    elsif current_user.role =='superadmin'
      if @user_role.update(user_params)
        redirect_to root_path
      else
        redirect_to user_path(@user)
      end
    end
  end

  def show
    @user = current_user
    @user_role = User.find(params[:id])
  end

  def index
    allowed?(action: :index, user: current_user)
    @counter ||= 0 unless @counter
    @users = User.all
    if params[:value] == nil
      @users_per_page = User.all.order(:id).limit(10).offset(@counter)
    else
      @counter += params[:value].to_i
      @users_per_page = User.all.order(:id).limit(10).offset(@counter)
    end
  end

end
