require_relative('../db/sql_runner')

class Country

attr_reader :name, :id, :continent_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @continent_id = options['continent_id'].to_i
  end

  def save()
    sql = "INSERT INTO countries (name, continent_id) VALUES ($1, $2) RETURNING id"
    values = [@name, @continent_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

def self.all()
  sql = "SELECT * FROM countries"
  results = SqlRunner.run(sql)
  return results.map{ |country| Country.new(country)}
end

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end
end
