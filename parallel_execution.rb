# frozen_string_literal: true
require "parallel"
require "benchmark"
require "pry"

class ParallelExecution

  class << self
    def execute(arr)
      # Parallel.each(arr) do |num|
      #   sleep_with_time(num)
      # end
      work_list = {}
      Parallel.each(arr, in_processes: 10, isolation: true) do |num|
        puts "Item: #{num}, Worker: #{Parallel.worker_number}"
        sleep_with_time(num)
      end

      puts work_list
      # puts Benchmark.measure {
      #   arr.each do |num|
      #     sleep_with_time(num)
      #   end
      # }
    end

    def sleep_with_time(num)
      # puts "Sleeping for #{num} seconds"
      sleep num
    end
  end
end

ParallelExecution.execute([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle)

# Sleeping for 3 seconds
# Sleeping for 4 seconds
# Sleeping for 2 seconds
# Sleeping for 3 seconds
# Sleeping for 3 seconds
# Sleeping for 1 seconds
# Sleeping for 3 seconds
# Sleeping for 1 seconds
# Sleeping for 2 seconds
# 0.009382   0.024702   0.090524 (  4.033601)
# Sleeping for 3 seconds
# Sleeping for 4 seconds
# Sleeping for 3 seconds
# Sleeping for 2 seconds
# Sleeping for 1 seconds
# Sleeping for 3 seconds
# Sleeping for 3 seconds
# Sleeping for 2 seconds
# Sleeping for 1 seconds
# 0.001734   0.001791   0.003525 ( 22.009052)