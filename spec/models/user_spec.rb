require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'kwambiee', photo: 'https:www.kwambiees.post', bio: 'A really lovely person', post_counter: 1) }

  before { subject.save }

  it 'Name should have a value' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post_counter must be an integer' do
    subject.post_counter = 'five'
    expect(subject).to_not be_valid
  end
  it 'Post_counter should be greater than or equal to 0' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end
end
