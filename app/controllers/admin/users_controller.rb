class Admin::UsersController < AdminController
  before_action :set_user, only: [:show]

  def index
    @users = User.includes(:group).all
  end

  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
