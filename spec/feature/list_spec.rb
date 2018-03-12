feature 'shows an array of links' do
  scenario 'Can show an array' do
  	visit('/')
    expect(page).to have_content 'www.makersacademy.com'
    expect(page).to have_content 'www.bbc.co.uk'
    expect(page).to have_content 'www.youtube.com'
  end
end    