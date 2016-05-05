feature 'create links' do
  scenario 'add link to a list of links' do
    visit '/links'
    click_button 'New'
    fill_in :title, with: "Google"
    fill_in :url, with: "https://www.google.co.uk/"
    click_button 'Create link'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
