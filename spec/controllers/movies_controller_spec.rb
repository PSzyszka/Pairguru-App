require "rails_helper"

describe MoviesController, type: :controller do
  describe '#index' do
    it 'assigns all movies' do
      movies = create_list(:movie, 3)

      get :index
      expect(assigns(:movies)).to eq(movies)
    end
  end

  describe '#show' do
    it 'assigns movie, comment and comments' do
      movie    = create(:movie)
      comments = create_list(:comment, 4, movie: movie)

      get :show, params: { id: movie.id }

      expect(assigns(:movie)).to eq(movie)
      expect(assigns(:comments)).to eq(comments)
      expect(assigns(:comment)).to be_kind_of(Comment)
    end
  end
end
