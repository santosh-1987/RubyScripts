class Model

  @@all_fields = []

  def self.field(name)
    @@all_fields << name
    attr_accessor(name)
    send(:define_method,"find_#{name}") do
      return send(name)
    end
  end

  def print
    @@all_fields.each do |field|
      puts send(field)
    end
  end
end

class Account < Model
  field :balance
  field :address
  field :name
end

a = Account.new
a.balance = 1_000_000
a.address = "212 Main St."
a.name = "Mr MooCow"

a.find_balance

# >> 1000000
