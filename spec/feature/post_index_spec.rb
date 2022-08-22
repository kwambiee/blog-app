require 'rails_helper'

RSpec.describe 'User Post index page', type: :feature do
  before do
    user = User.create!(name: 'test', photo: 'test.jpg', bio: 'test', post_counter: 0)
    @post = Post.create(title: 'test', text: 'tester', author_id: user.id, comments_counter: 0, likes_counter: 0)
    @comments = Comment.create(text: 'test', author_id: user.id, post_id: @post.id)

    visit user_posts_path(user)
  end

  it 'I can see the user\'s profile picture.' do
    expect(page).to have_css("img[src=\"#{@post.author.photo}\"]")
  end
  it 'I can see the user\'s name.' do
    expect(page).to have_content @post.author.name
  end
  it 'I can see the number of posts.' do
    expect(page).to have_content @post.author.posts.size
  end
  it 'I can see post\'s title.' do
    expect(page).to have_content @post.title
  end
  it 'I can see post\'s body.' do
    expect(page).to have_content @post.text
  end
  it 'I can see the first comments on a post.' do
    expect(page).to have_content @comments.text
  end
  it 'I can see how many comments a post has.' do
    expect(page).to have_content @post.comments.size
  end
  it 'I can see the number of likes a post has.' do
    expect(page).to have_content @post.likes.size
  end
  it 'When I click on a post, it redirects me to that post\'s show page.' do
    click_link @post.title
    expect(current_path).to eq user_post_path(@post.author_id, @post.id)
  end
end
