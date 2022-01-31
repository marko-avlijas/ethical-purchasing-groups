class Admin::UsersController < AdminController
  before_action :set_user, only: [:show]

  def index
    order = { id: :desc }
    @users = User.includes(:group)
                 .by_name(params[:name])
                 .by_email(params[:email])
                 .af_email_confirmed(params[:confirmed])
                 .af_locked(params[:locked])
                 .af_is_producer(params[:is_producer])
                 .af_admin(params[:admin])
                 .order(order)
  end

  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
