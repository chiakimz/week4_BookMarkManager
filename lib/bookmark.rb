require 'pg'
require_relative 'database_connection'
require 'uri'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{options[:url]}', '#{options[:title]}') RETURNING id, url, title")
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end

  def ==(other)
    @id == other.id
  end

  def self.delete(id)
    DatabaseConnection.query('DELETE FROM bookmarks WHERE id = #{id}')
  end

  def self.update(id, options)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{options[:url]}', title = '#{options[:title]}' WHERE id = '#{id}'")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }.first
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
