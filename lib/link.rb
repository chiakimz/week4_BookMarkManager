require 'pg'
require 'database_connection'

class Link

  def self.all
    result = DatabaseConnection.query("SELECT url FROM links")
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
