require_relative( '../db/sql_runner' )

class Book

  attr_reader :id, :title, :category, :available

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @category = options['category']
    @available = options['available'] #TODO make BOOLEAN and default
  end

  def save()
    sql = "INSERT INTO books (title, category, available) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @category, @available]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM books"
    results = SqlRunner.run(sql)
    return results.map { |book_hash| Book.new(book_hash) }
  end

  def self.find( id )
    sql = "SELECT * FROM books
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Book.new( results.first )
  end

  def update()
    sql = "UPDATE books SET (title, category, available) VALUES ($1, $2, $3) WHERE id = $4"
    values = [@title, @category, @available, @id]
    SqlRunner.run(sql, values) 
  end

  def self.delete_all
    sql = "DELETE FROM books"
    SqlRunner.run( sql )
  end

end
