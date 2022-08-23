require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before do
    user = User.create(name: 'test', photo: 'test.jpg', bio: 'test', post_counter: 0)
    @post = Post.create(title: 'test', text: 'Sample  body', author_id: user.id, comments_counter: 0,
                        likes_counter: 0)

    visit user_path(id: user.id)
  end
  it 'I can see user profile picture' do
    expect(page).to have_css("img[src=\"#{@post.author.photo}\"]")
  end
  it 'I can see user\'s name' do
    expect(page).to have_content @post.author.name
  end
  it 'I can see the number of posts' do
    expect(page).to have_content @post.author.posts.size
  end
  it 'I can see user\'s bio' do
    expect(page).to have_content @post.author.bio
  end
  it 'I can see a button that lets me see all posts' do
    expect(page).to have_link 'See all posts'
  end
  it 'When I click a user\'s post, it redirects me to that post\'s show page' do
    click_link @post.title
    expect(current_path).to eq user_post_path(@post.author_id, @post.id)
  end
  it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
    click_link 'See all posts'
    expect(current_path).to eq user_posts_path(@post.author_id)
  end
end
