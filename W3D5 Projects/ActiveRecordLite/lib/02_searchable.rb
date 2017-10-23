require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    input = params.map { |key, _ | "#{key} = ?" }.join(" AND ")
    data = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{input}
      SQL
      parse_all(data)
  end
end

class SQLObject
  extend Searchable
  # Mixin Searchable here...
end
