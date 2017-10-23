
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @data ||= DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL

    @data.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do #getter
        attributes[col]
      end
      define_method("#{col}=") do |value| #setter method
        attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{table_name}
    SQL
    parse_all(data)
  end

  def self.parse_all(results)
    results.map {|el| self.new(el)}
  end

  def self.find(id)
    data = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM #{table_name}
      WHERE id = ?
    SQL
    parse_all(data).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)
      self.send("#{attr_name.to_sym}=", value)
    end
    params
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |element|
      self.send(element)
    end
  end

  def insert
    # p self.attribute_values
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")
    data = DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    columns = self.class.columns
    input = columns.map { |element| "#{element} = ?" }.join(", ")
    data = DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{input}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    if id.nil?
      insert
    else
      update
    end
  end
end
