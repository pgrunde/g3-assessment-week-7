class MessageMaker

  def initialize
    super
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV'])
  end

  def insert_message(name, message)
    @database_connection.sql("INSERT INTO messages (name, message) VALUES ('#{name}','#{message}')")
  end

  def find_all_messages
    @database_connection.sql("SELECT * FROM messages")
  end
end