class StaticPagesController < ApplicationController
  before_action :set_host
  skip_before_action :authenticate_user!

  def terms_of_service
  end

  def privacy_policy
  end

  private

    def set_host
      @host = request.host
    end
end
