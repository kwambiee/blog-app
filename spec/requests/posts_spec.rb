require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(1) }
    it 'response status correct' do
      expect(response).to have_http_status(:success)
    end
    it 'renders correct template' do
      expect(response).to render_template('index')
    end
    it 'response body contains correct placeholder text' do
      expect(response.body).to include('Here is a list of post from this user')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(1, 1) }
    it 'returns response status correct' do
      expect(response).to have_http_status(:success)
    end
    it 'renders correct template' do
      expect(response).to render_template('show')
    end
    it 'response body contains correct placeholder text' do
      expect(response.body).to include('Here is the post with the given id')
    end
  end
end
