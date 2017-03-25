class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def allowed?(action:, user:)
    if user.user? || user.moderate?
       flash[:notice] = "Sorry. You are not allowed to perform this action."
       return redirect_to user_path(user), notice: "Sorry. You do not have the permission to to this page."
     end
  end

end
