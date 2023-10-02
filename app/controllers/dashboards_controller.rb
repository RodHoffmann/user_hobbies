class DashboardsController < ApplicationController
  def show
    @dashboard = current_user.dashboard
  end

  def edit
    @hobbies = Hobby.all
    @dashboard = current_user.dashboard
  end

  # def update
  #   @dashboard = current_user.dashboard
  #   if @dashboard.update(dashboard_params)
  #     redirect_to dashboard_path
  #   else
  #     render :edit
  #   end
  # end
end
