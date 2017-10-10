class Employee

  attr_reader :salary

  def initialize(name, salary, title, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end

end

class Manager < Employee

  attr_accessor :direct_reports

  def initialize(name, salary, title, boss)
    @direct_reports =[]
    super
  end

  def add_direct(employee)
    self.direct_reports.concat([employee])
  end

  def bonus(multiplier)
    emp_salary = 0
    self.direct_reports.each do |employee|
      emp_salary += employee.salary
    end
    bonus = emp_salary * multiplier
  end


end
#
ned = Manager.new("Ned", 1000000,	"Founder",	nil)
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000,	"TA", darren)
david = Employee.new("David", 10000, "TA", darren)

darren.add_direct(david)
darren.add_direct(shawna)
ned.add_direct(darren)
ned.add_direct(shawna)
ned.add_direct(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
