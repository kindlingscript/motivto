class ListsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_current_user_to_own_list, :only => [:show]

	def new
		@list = List.new
	end

	def create
		@list = current_user.lists.create(list_params)
		redirect_to user_path(current_user)
	end

	def show
		@item = Item.new
	end

	private

	def list_params
		params.require(:list).permit(:title)
	end

	helper_method :current_list
	def current_list
		@current_list ||= List.find(params[:id])
	end

	def require_current_user_to_own_list
		if current_list.user != current_user
			render :text => "Unauthorized", :status => :unauthorized
		end
	end

end
