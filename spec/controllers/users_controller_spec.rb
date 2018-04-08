require "rails_helper"

describe UsersController, type: :controller do
  describe '#index' do
    it 'assigns users with top comments from last week with correct order' do
      user1 = create(:user)
      create_list(:comment, 5, user: user1, created_at: 1.day.ago)

      user2 = create(:user)
      create_list(:comment, 3, user: user2, created_at: 2.day.ago)

      user3 = create(:user)
      create_list(:comment, 7, user: user3, created_at: 4.day.ago)

      user4 = create(:user)
      create_list(:comment, 10, user: user4, created_at: 5.day.ago)

      user5 = create(:user)
      create_list(:comment, 20, user: user5, created_at: 3.day.ago)

      user6 = create(:user)
      create_list(:comment, 25, user: user6, created_at: 4.day.ago)

      user7 = create(:user)
      create_list(:comment, 27, user: user7, created_at: 5.day.ago)

      user8 = create(:user)
      create_list(:comment, 30, user: user8, created_at: 6.day.ago)

      user9 = create(:user)
      create_list(:comment, 32, user: user9, created_at: 7.day.ago)

      user10 = create(:user)
      create_list(:comment, 34, user: user10, created_at: 2.day.ago)

      user11 = create(:user)
      create_list(:comment, 35, user: user11, created_at: 3.day.ago)

      user12 = create(:user)
      create_list(:comment, 37, user: user12, created_at: 4.day.ago)

      user13 = create(:user)
      create_list(:comment, 40, user: user13, created_at: 8.day.ago)

      get :index

      top_user_ids = [
        user12.id,
        user11.id,
        user10.id,
        user8.id,
        user7.id,
        user6.id,
        user5.id,
        user4.id,
        user3.id,
        user1.id
      ]
      expect(assigns(:users).map(&:id)).to eq(top_user_ids)
    end
  end
end
