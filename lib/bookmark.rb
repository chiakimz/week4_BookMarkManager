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
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.create(options)
    return false unless is_url?(options[:url])
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{options[:url]}')")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
