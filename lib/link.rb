require 'pg'
require 'database_connection'

class Link
  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'bookmark_manager_test')
    else
      return PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.all
    result = connection.exec("SELECT url FROM links")
    result.map { |link| link['url'] }
  end
  
  def self.create(options)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{options[:url]}')")
  end
end    
