class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_current_user_to_own_profile, :only => [:show]

	def show
		@user = User.find(params[:id])
	end

  private

  def require_current_user_to_own_profile
    if current_user.id.to_s != params[:id]
      render :text => "Unauthorized", :status => :unauthorized
    end
  end

end
