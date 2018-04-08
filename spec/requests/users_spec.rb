require "rails_helper"

describe "Users requests", type: :request do
  let!(:users) { create_list(:user, 12, :with_comments) }

  describe "users list" do
    it "displays only 10 users" do
      visit "/users"

      expect(page).to have_selector("table tbody tr", count: 10)
    end
  end
end
