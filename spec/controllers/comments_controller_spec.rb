require "rails_helper"

describe CommentsController, type: :controller do
  describe '#create' do
    context 'with valid params' do
      it 'creates a new comment' do
        user = create(:user)
        sign_in(user)

        movie  = create(:movie)
        params = {
          movie_id: movie.id, comment: { description: 'description', movie_id: movie.id }
        }

        expect { post(:create, params: params) }.to change { Comment.count }
      end

      it 'redirects to movie path' do
        user = create(:user)
        sign_in(user)

        movie  = create(:movie)
        params = {
          movie_id: movie.id, comment: { description: 'description', movie_id: movie.id }
        }

        expect(post(:create, params: params)).to redirect_to(movie_path(movie.id))
      end
    end

    context 'with invalid params' do
      it 'redirects to movie path' do
        user = create(:user)
        sign_in(user)

        movie  = create(:movie)
        params = {
          movie_id: movie.id, comment: { description: '', movie_id: movie.id }
        }

        expect(post(:create, params: params)).to redirect_to(movie_path(movie.id))
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe '#destroy' do
    let!(:movie) { create(:movie) }
    let!(:comment) { create(:comment, movie: movie) }

    before do
      user = create(:user)
      sign_in(user)
    end

    it 'removes an comment' do
      params  = { id: comment.id, movie_id: movie.id }

      expect { delete(:destroy, params: params) }
        .to change { Comment.count }.by(-1)
    end

    it 'redirects to movie path' do
      params  = { id: comment.id, movie_id: movie.id }

      expect(delete(:destroy, params: params)).to redirect_to(movie_path(movie.id))
    end
  end
end
