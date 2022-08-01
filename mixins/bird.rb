module Bird
  attr_accessor :feather, :wings, :color

  def fly(flightless)
    flightless ? "I am flying" : "I cannot fly"
  end

  def lay_eggs(mammal)
    mammal ? "I cannot lay egg" : "I can lay egg"
  end

end