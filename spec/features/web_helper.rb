def sign_up
  visit '/user/new'
  fill_in :username, with: 'username'
  fill_in :email, with: 'username@username.com'
  fill_in :password, with: 'username123'
  click_button 'Create account'
end