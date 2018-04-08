class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :description, :movie_id, :user_id, presence: true
  validates :movie_id, uniqueness: { scope: :user_id }
end
