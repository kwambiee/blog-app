require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 1, post_id: 1) }

  before { subject.save }

  it 'Author_id should be a number' do
    subject.author_id = 'aa'
    expect(subject).to_not be_valid
  end
  it 'Post_id should be a number' do
    subject.post_id = 'brew'
    expect(subject).to_not be_valid
  end
end
