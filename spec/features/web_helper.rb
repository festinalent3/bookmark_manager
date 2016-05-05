def sign_up
  visit '/user/new'
  fill_in :username, with: 'username'
  fill_in :email, with: 'username@username.com'
  fill_in :password, with: 'username123'
  fill_in :password_confirmation, with: 'username123'
  click_button 'Create account'
end


def sign_up_wrong_passwords
  visit '/user/new'
  fill_in :username, with: 'username'
  fill_in :email, with: 'username@username.com'
  fill_in :password, with: 'username123'
  fill_in :password_confirmation, with: '123username'
  click_button 'Create account'
end
