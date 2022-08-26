require 'swagger_helper'

describe 'Posts API' do
  path '/api/v1/users/{id}/posts' do
    get 'Get all posts' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'posts found' do
        schema type: :array, items: { '$ref' => '#/components/schemas/Post' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}/posts/{id}' do
    get 'Get post by id' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'post found' do
        schema '$ref' => '#/components/schemas/Post'
        run_test!
      end
    end
  end
end
