require_relative( '../db/sql_runner' )

class Customer

  attr_reader :id, :name, :postal_code

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @postal_code = options['postal_code']
  end

  def save()
    sql = "INSERT INTO customers (name, postal_code) VALUES ($1, $2) RETURNING id"
    values = [@name, @postal_code]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map{|customer_hash| Customer.new(customer_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Customer.new(result.first)
  end

  def update()
    sql = "UPDATE customers SET (name, postal_code) = ($1, $2) WHERE id = $3"
    values = [@name, @postal_code, @id]
    SqlRunner.run(sql, values)
  end

  def rented_book_count()
    sql = "SELECT COUNT(*) FROM rentals WHERE customer_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.first['count'].to_i
  end

  def self.delete(id)
    sql = "DELETE FROM customers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run( sql )
  end

end
