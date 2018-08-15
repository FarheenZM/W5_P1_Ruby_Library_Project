require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'lims', host: 'localhost' }) #if you want to run the app locally uncomment this.

      db =PG.connect( {dbname: 'd9692ef0qaq379', #whereas this is for heroku database
      host: 'ec2-174-129-236-147.compute-1.amazonaws.com',
      port: 5432, user: 'drjmuiepaaseim', password: '8addd18f0d0fcae659fabcdb1cd2df7fd926d4795397f966287828249282fc67'})

      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
