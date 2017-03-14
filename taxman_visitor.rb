class Goodie
  attr_accessor :price
  def initialize(price)
    @price = price
  end

  def accept(visitor)
    puts visitor
    puts self
    visitor.visit(self)
  end

end

class TaxManVisitor
  def initialize(rate)
    @rate = rate/100.0
  end

  def visit(obj)
    if obj.respond_to?(:price)
      obj.instance_eval {class << self; attr_accessor :tax; end }
      obj.tax = obj.price * @rate
    end
  end
end

x = Goodie.new(25)
puts "price is #{x.price}"
x.accept(TaxManVisitor.new(9))
puts "Tax is #{x.tax}"
