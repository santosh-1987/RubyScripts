class Accessor
  attr_accessor :name, :quantity

  def initialize(name)
    @name = name
    @quantity = 1
    # puts "The Public SKU is #{public_sku}"
    # puts "The Protected SKU is #{protected_sku}"
    # puts "The Private SKU is #{private_sku}"
  end

  def self.fetch_data(&block)
    return yield if block_given?
  end

  def public_sku
    name.concat(" - You are Public ")
  end

  protected
  def protected_sku
    name.concat(" - How are You Protected ? ")
  end

  private
  def private_sku
    name.concat(" - How is Your Privacy ?")
  end
end


class StepAccessor  < Accessor
  def initialize(name)
    super
  end

  def get_methods
    return private_sku
  end
end

a = Accessor.new("Santosh")
# puts "Calling Step Accessor"
s = StepAccessor.new("Jyoti")
puts s.get_methods


# ["public_sku","protected_sku","private_sku"].each do |method|
#   begin
#     puts Accessor.fetch_data { a.send(method) }
#     puts Accessor.fetch_data { a.public_send(method) }
#   rescue Exception => e
#     puts e.inspect
#     next
#   end
# end
#
# ["public_sku","protected_sku","private_sku"].each do |method|
#   begin
#     puts StepAccessor.fetch_data { a.send(method) }
#     puts StepAccessor.fetch_data { a.public_send(method) }
#   rescue Exception => e
#     puts e.inspect
#     next
#   end
# end
