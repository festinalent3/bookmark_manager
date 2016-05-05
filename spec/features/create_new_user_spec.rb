
feature 'add a new user' do
  scenario 'add new user user count increase by 1' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, username@username.com')
    expect(User.first.email).to eq('username@username.com')
  end
end