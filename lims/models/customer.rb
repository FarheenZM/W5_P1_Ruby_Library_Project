require_relative( '../db/sql_runner' )

class Customer

  attr_accessor :id, :name, :address

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
  end

  def save()
    sql = "INSERT INTO customers (name, address) VALUES ($1, $2) RETURNING id"
    values = [@name, @address]
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
    sql = "UPDATE customers SET (name, address) = ($1, $2) WHERE id = $3"
    values = [@name, @address, @id]
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
