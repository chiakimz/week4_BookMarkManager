require 'link'
  describe 'Link' do
  	describe '.all' do
      it 'shows you all links' do
      	links = Link.all
      	expect(links).to include('www.makersacademy.com')
      	expect(links).to include('www.bbc.co.uk')
      	expect(links).to include('www.youtube.com')
      end
    end 
  end
  