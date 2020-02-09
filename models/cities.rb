require_relative('../db/sql_runner')

class City

attr_reader(:name, :id, :country_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country_id = options['country_id'].to_i
  end

  def save()
    sql = "INSERT INTO cities (name, country_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE cities SET (name, country_id)
    = ($1, $2) WHERE id = $3"
    values = [@name, @country_id]
    SqlRunner.run(sql, values)
  end

 def delete()
   sql = "DELETE FROM cities WHERE id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def country()
   sql = "SELECT * FROM countries WHERE id = $1"
   values = [@country_id]
   results = SqlRunner.run(sql, values)
   return Country.new(results.first)
 end

  def self.all()
    sql = "SELECT * FROM cities"
    results = SqlRunner.run(sql)
    return results.map { |city| City.new(city) }
  end

  def self.find()
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return City.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end
end
