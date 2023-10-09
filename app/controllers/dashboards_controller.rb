class DashboardsController < ApplicationController
  def show
    @dashboard = current_user.dashboard
    @hobby_names = @dashboard.user.hobbies.pluck(:name)
    @similar_user = FindSimilarUsers.new(current_user).find
  end

  def edit
    @hobbies = Hobby.all
  end
end
