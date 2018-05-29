
feature 'Viewing links' do
  scenario 'A user can see links' do
    visit('/bookmarks')

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Google"
    expect(page).to have_content "Facebook"
  end
end
