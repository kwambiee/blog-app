require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it 'response status correct' do
      expect(response).to have_http_status(:success)
    end
    it 'renders correct template' do
      expect(response).to render_template('index')
    end
    it 'response body contains correct placeholder text' do
      expect(response.body).to include('Here is a list of all users and their number of posts')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(2) }
    it 'returns response status correct' do
      expect(response).to have_http_status(:success)
    end
    it 'renders correct template' do
      expect(response).to render_template('show')
    end
    it 'response body contains correct placeholder text' do
      expect(response.body).to include('Here is the profile page of user with the given id')
    end
  end
end
