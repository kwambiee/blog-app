require 'rails_helper'

feature 'user index' do
  background do
    @user = User.create(name: 'test', photo: 'test.jpg', bio: 'test', post_counter: 0)

    visit users_path
  end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content @user.name
  end

  scenario 'to show number of posts' do
    expect(page).to have_content @user.posts.size
  end

  scenario 'to show the profile picture of users' do
    expect(page).to have_css("img[src=\"#{@user.photo}\"]")
  end

  scenario 'gets redirected to that user\'s show page' do
    click_link @user.name
    expect(current_path).to eq user_path(@user)
  end
end
