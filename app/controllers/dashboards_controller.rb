class DashboardsController < ApplicationController
  def show
    @dashboard = current_user.dashboard
  end
end
