class FindSimilarUsers
  def initialize(user)
    @user = user
    @users = User.all
    # change this value between 1 and 0 for more or less similar users respectively
    @match_ratio = 0.7
  end

  def find
    matches = []
    match = nil
    matches = @users.select do |user|
        user != @user && match(user) >= @match_ratio
    end
    if check_wohnort(matches).any?
      match = check_wohnort(matches)[rand(check_wohnort(matches).length - 1)]
    elsif matches.any?
      match = matches[rand(matches.length - 1)]
    else
      match = nil
    end
    match
  end


  end

  private

  def check_wohnort(matches)
    if matches.nil?
      return nil
    else
      matches.select do |match|
          match.wohnort == @user.wohnort
      end
    end
  end

  def match(user)
    count = user.hobbies.count do |hobby|
      @user.hobbies.each do |hobby2|
        bookmark.hobby.name == hobby2.hobby.name
      end
    end.to_f / user.bookmarks.count.to_f
  end
