require 'primelist'
require 'primelist2'
require 'benchmark'
include Benchmark

 bm(12) do |test|
   test.report("1st attempt:") do
      x = PrimeList.new(1000)
   end
  
   test.report("2nd attempt:") do
      x = PrimeList2.new(1000)
   end
end

         