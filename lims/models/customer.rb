require_relative( '../db/sql_runner' )

class Customer

  attr_reader :id, :name, :postal_code
  attr_accessor :rented_book_count

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @postal_code = options['postal_code']
    @rented_book_count = options['rented_book_count'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, postal_code, rented_book_count) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @postal_code, @rented_book_count]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
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
    sql = "UPDATE customers SET (name, postal_code, rented_book_count) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @postal_code, @rented_book_count, @id]
    SqlRunner.run(sql, values)
  end

  def self.all_who_can_rent()
    sql = "SELECT * FROM customers WHERE rented_book_count < 2"
    results = SqlRunner.run(sql)
    return results.map{|customer_hash| Customer.new(customer_hash)}
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run( sql )
  end

end
