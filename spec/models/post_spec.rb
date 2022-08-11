require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 1, title: 'title', text: 'Awesome Post', comments_counter: 1, likes_counter: 1) }

  before { subject.save }

  it 'Title should have a maximum length of 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'Comments_counter must be an integer' do
    subject.comments_counter = 'aa'
    expect(subject).to_not be_valid
  end

  it 'Comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Likes_counter must be an integer' do
    subject.likes_counter = 'aa'
    expect(subject).to_not be_valid
  end

  it 'Likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end
end
