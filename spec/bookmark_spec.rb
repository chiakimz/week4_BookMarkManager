
require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do

      bookmark_1 = Bookmark.create(url: "http://makersacademy.com")
      bookmark_2 = Bookmark.create(url: "http://destroyallsoftware.com")
      bookmark_3 = Bookmark.create(url: "http://google.com")

      expected_bookmarks = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'does not create a new bookmark if the URL is not valid' do
      bookmark = Bookmark.create(url: 'not a real url')

      expect(Bookmark.all).not_to include bookmark
    end

    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com')

      expect(Bookmark.all).to include bookmark
    end
  end

  describe '#==' do
    it 'two Bookmarks are equal if their IDs match' do
      bookmark_1 = Bookmark.new(1, url: 'http://testbookmark.com', title: 'title')
      bookmark_2 = Bookmark.new(1, url: 'http://testbookmark.com', title: 'title')

      expect(bookmark_1).to eq bookmark_2
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      Bookmark.create('http://www.makersacademy.com')
      Bookmark.delete(1)

      bookmarks = Bookmark.all
      urls = bookmarks.map(&:url)

      expect(urls).not_to include 'http://www.makersacademy.com'
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      Bookmark.create(url: 'http://www.makersacademy.com')
      Bookmark.update(1, url: 'http://www.fakersacademy.com', title: 'Fakers Academy')

      bookmarks = Bookmark.all
      urls = bookmarks.map(&:url)
      titles = bookmarks.map(&:title)

      expect(urls).not_to include 'http://www.makersacademy.com'
      expect(titles).not_to include 'Makers Academy'
      expect(urls).to include 'http://www.fakersacademy.com'
      expect(titles).to include 'Fakers Academy'
    end
  end
end
