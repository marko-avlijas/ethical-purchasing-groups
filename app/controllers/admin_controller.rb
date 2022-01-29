class AdminController < ApplicationController
  before_action :require_superadmin!

  protected

    def require_superadmin!
      return if current_user.superadmin?

      redirect_to root_url, alert: t("admin.superadmin_required")
    end
end

