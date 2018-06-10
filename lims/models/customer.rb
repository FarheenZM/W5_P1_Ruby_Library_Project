require_relative( '../db/sql_runner' )

class Customer

  attr_reader :name, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO customers
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map{|customer|}
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run( sql )
  end

end
