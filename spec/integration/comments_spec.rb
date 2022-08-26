require 'swagger_helper'

describe 'Comments API' do
  path '/api/v1/users/{id}/posts/{id}/comments' do
    get 'Get all comments' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'comments found' do
        schema type: :array, items: { '$ref' => '#/components/schemas/Comment' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}/posts/{id}/comments' do
    post 'Create a comment' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string },
          author_id: { type: :string },
          post_id: { type: :string }
        }
      }
      response '201', 'comment created' do
        schema '$ref' => '#/components/schemas/Comment'
        run_test!
      end
    end
  end
end
