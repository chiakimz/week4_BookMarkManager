
feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    visit('/bookmarks/1/edit')

    fill_in('url', with: 'http://www.fakersacademy.com')
    fill_in('title', with: 'Fakers Academy')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Makers Academy'
    expect(page).to have_content 'Fakers Academy'
  end
end    
