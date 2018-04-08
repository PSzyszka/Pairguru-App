require "rails_helper"

describe Comment do
  it 'has a valid factory' do
    expect(create(:comment)).to be_valid
  end

  it 'allows to create only one comment for a movie by a certain user' do
    user  = create(:user)
    movie = create(:movie)

    create(:comment, user: user, movie: movie)
    comment = Comment.new(description: 'description', user: user, movie: movie)
    expect(comment).to be_invalid
  end
end
