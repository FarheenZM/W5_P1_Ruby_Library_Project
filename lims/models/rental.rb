require_relative( '../db/sql_runner' )

class Rental

  attr_reader :book_id, :customer_id, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @book_id = options['book_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals
    (
      book_id, customer_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@book_id, @customer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM rentals"
    SqlRunner.run( sql )
  end

end
