=begin

Attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality.

The benefits of this implementation are:

can be wrapped infinitely using Ruby instantiation
delegates through all decorators
can use same decorator more than once on component
The drawbacks of this implementation are:

cannot transparently use component’s original interface




The problems with inheritance include:

Choices are made statically.
Clients can’t control how and when to decorate a component.
Tight coupling.
Changing the internals of the superclass means all subclasses must change.
In Ruby, including a module is also inheritance:

https://github.com/nslocum/design-patterns-in-ruby

=end

class Coffee
  def cost
    2
  end
end

module Milk
  def cost
    super + 0.4
  end
end

module Sugar
  def cost
    super + 0.2
  end
end

coffee = Coffee.new
coffee.extend(Milk)
coffee.extend(Sugar)
coffee.cost   # 2.6


#The “Plain Old Ruby Object” (PORO) decorator

class Coffee
  def cost
    2
  end

  def origin
    "Colombia"
  end
end

class Milk
  def initialize(component)
    @component = component
  end

  def cost
    @component.cost + 0.4
  end
end

coffee = Coffee.new
Sugar.new(Milk.new(coffee)).cost  # 2.6
Sugar.new(Sugar.new(coffee)).cost # 2.4
Sugar.new(Milk.new(coffee)).class # Sugar
Milk.new(coffee).origin           # NoMethodError
