
feature 'add a new user' do
  scenario 'add new user user count increase by 1' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, username@username.com')
    expect(User.first.email).to eq('username@username.com')
  end
  scenario 'it does not create a new user if passwords are not matching' do
    expect { sign_up_wrong_passwords }.not_to change(User, :count)
    expect(current_path).to eq('/user/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end
  scenario "User can't sign up without an email address" do
    expect { no_email }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end
  scenario 'user can not sign up using an invalid email' do
    expect { invalid_email }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user cannot sign up with an existing email' do
  sign_up
  expect { sign_up }.to_not change(User, :count)
  expect(page).to have_content('Email is already taken')
end
end
