require_relative( '../db/sql_runner' )

class Book

  attr_reader :id, :title, :category

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @category = options['category']
  end

  def save()
    sql = "INSERT INTO books (title, category) VALUES ($1, $2) RETURNING id"
    values = [@title, @category]
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
    sql = "UPDATE books SET (title, category) = ($1, $2) WHERE id = $3"
    values = [@title, @category, @id]
    SqlRunner.run(sql, values)
  end

  def is_available()
    sql = "SELECT COUNT(*) FROM rentals WHERE book_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return TRUE if result.first['count'].to_i == 0
    return FALSE
  end

  def self.search( search_fields )
    sql = "SELECT * FROM books WHERE LOWER(title) LIKE $1 OR category LIKE $2"
    wildcard_search = "%" + search_fields[:keywords].downcase + "%"
    values = [wildcard_search, search_fields[:category]]
    results = SqlRunner.run(sql, values)
    return results.map { |book_hash| Book.new(book_hash) }
  end

  def self.delete(id)
    sql = "DELETE FROM books WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM books"
    SqlRunner.run( sql )
  end

end
