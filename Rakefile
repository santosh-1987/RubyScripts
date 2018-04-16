namespace :pick do
  desc "Pick a random user as the winner"
  task :winner do
    puts "Sorted: #{@string}"
  end

  desc "Pick a random product as the prize"
  task :prize do
    @string = "#{pick([5,4,3,2,1,3,4,5,6,6])}"
  end
  
  desc "Pick a random prize and winner"
  task :all => [:prize, :winner]
  
  def pick(model_class)
    model_class.sort
  end
end
