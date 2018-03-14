feature 'shows an array of links' do
  scenario 'Can show an array' do
  	visit('/')
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.facebook.com'
    expect(page).to have_content 'http://www.google.com'
  end
end    