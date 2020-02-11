require_relative('../db/sql_runner')

class City

attr_reader(:name, :id, :visited, :country_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country_id = options['country_id'].to_i
    @visited = options['visited']
  end

  def save()
    sql = "INSERT INTO cities (name, country_id, visited) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @country_id, @visited]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE cities SET (name, country_id, visited)
    = ($1, $2, $3) WHERE id = $4"
    values = [@name, @country_id, @visited, @id]
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
   # return results.map { |country| Country.new(country)}
 end

  def self.all()
    sql = "SELECT * FROM cities"
    results = SqlRunner.run(sql)
    return results.map { |city| City.new(city) }
  end

  def self.find(id)
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [id.to_i]
    results = SqlRunner.run(sql, values)
    # if results == nil
    #   return nil
    # else
    return City.new(results.first)
  # end
  end

  def self.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end
end
