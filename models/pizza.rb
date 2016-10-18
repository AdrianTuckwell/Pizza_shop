require_relative '../db/sql_runner'

class Pizza

  attr_reader :first_name, :last_name, :quantity, :topping, :id


  def initialize(params)
    @id = nil ||  params['id'].to_i
    @first_name = params['first_name']
    @last_name =  params['last_name']
    @topping =    params['topping']
    @quantity =   params['quantity'].to_i

  end

  def full_name()
    return "#{@first_name} #{@last_name}" 
  end

  def total()
    return @quantity * 10
  end

  def save
    sql = "INSERT INTO pizzas (
    first_name,
    last_name,
    topping,
    quantity) VALUES (
    '#{@first_name}',
    '#{@last_name}',
    '#{@topping}',
    #{@quantity}
    ) RETURNING *"
    pizza_data = SqlRunner.run(sql)
    @id = pizza_data.first()['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM pizzas"
    pizzas = SqlRunner.run(sql)
    result = pizzas.map{|pizza| Pizza.new(pizza)}
    return result
  end

end