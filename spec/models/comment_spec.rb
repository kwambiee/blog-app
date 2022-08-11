require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(author_id: 1, post_id: 1, text: 'Really cool') }

  before { subject.save }

  it 'Title is valid' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'Author_id should be a number' do
    subject.author_id = 'a'
    expect(subject).to_not be_valid
  end

  it 'Post_id should be a number' do
    subject.post_id = 'see'
    expect(subject).to_not be_valid
  end
end
