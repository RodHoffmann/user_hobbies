class FindSimilarUsers
  def initialize(user)
    @user = user
    # change this value between 0 and 1 for more or less similar users respectively
    match_ratio = 0.3
    @minimum_common_hobbies = (user.hobbies.count * match_ratio).ceil
    @wohnort = user.wohnort.downcase
  end

  def find
    matches_same_city = matching_users_same_city
    return matches_same_city[rand(matches_same_city.length - 1)] if matches_same_city.any?

    matches_different_city = matching_users_different_city
    return matches_different_city[rand(matches_different_city.length - 1)] if matches_different_city.any?

    nil
  end

  private

  def matching_users_same_city
    User.joins(:hobbies)
        .where.not(id: @user.id) # Exclude the current user
        .where(wohnort: @wohnort.downcase) # Match users in the same city
        .where(hobbies: { id: @user.hobby_ids }) # Match users with at least one common hobby
        .group('users.id')
        .having('COUNT(DISTINCT hobbies.id) >= ?', @minimum_common_hobbies)
  end

  def matching_users_different_city
    User.joins(:hobbies)
        .where.not(id: @user.id) # Exclude the current user
        .where.not(wohnort: @wohnort) # Match users in different cities
        .where(hobbies: { id: @user.hobby_ids }) # Match users with at least one common hobby
        .group('users.id')
        .having('COUNT(DISTINCT hobbies.id) >= ?', @minimum_common_hobbies)
  end
end
