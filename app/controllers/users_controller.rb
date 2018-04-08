class UsersController < ApplicationController

  def index
    @users = best_users
  end

  private
  def best_users
    User.select("users.*, COUNT(comments.id) as comment_count")
        .joins("LEFT OUTER JOIN comments ON (comments.user_id = users.id)")
        .order('comment_count DESC')
        .merge(Comment.where(created_at: (Time.current - 7.days)..Time.current))
        .group("users.id")
        .limit(10)
  end
end
