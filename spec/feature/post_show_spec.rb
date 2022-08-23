require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  before do
    user = User.create(name: 'test', photo: 'test.jpg', bio: 'test', post_counter: 0)
    post = Post.create(title: 'test', text: 'comments section', author_id: user.id, comments_counter: 0,
                       likes_counter: 0)
    @comment = Comment.create!(text: 'test', author_id: user.id, post_id: post.id)
    @like = Like.create(author_id: user.id, post_id: post.id)

    visit user_post_path(user, post)
  end

  it 'I can see the post\'s title.' do
    expect(page).to have_content @comment.post.title
  end
  it 'I can see who wrote the post.' do
    expect(page).to have_content @comment.post.author.name
  end
  it 'I can see how many comments the post has.' do
    expect(page).to have_content @comment.post.comments.size
  end
  it 'I can see how many likes the post has.' do
    expect(page).to have_content @comment.post.likes.size
  end
  it 'I can see the post\'s body.' do
    expect(page).to have_content @comment.post.text
  end
  it 'I can see the username of the commentator.' do
    expect(page).to have_content @comment.author.name
  end
  it 'I can see the comment each commentor left.' do
    expect(page).to have_content @comment.text
  end
end
