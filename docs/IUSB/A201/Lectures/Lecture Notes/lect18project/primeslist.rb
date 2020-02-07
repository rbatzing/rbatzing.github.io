# An initial attempt to create this class
class PrimeList
  # Make a list of primes upto or equal to the Number n
    def initialize(n)
       @max = n
       @primes = Array.new()
       (2..n).each do |i|
           if is_prime?(i)
              @primes << i
           end
        end
     end
      
  # Check if a number is prime      
    def is_prime?(n)
      (2..(n-1)).each do |m|
          # check if n is divisible by m 
          if (m * (n/m)) == n
              return false
            end
      end
      return true
    end
    
  # Show the list of prime numbers found 
    def to_s
       text = "Prime numbers " +
               "(upto " + @max.to_s +  ") : "
       output = ""
       @primes.each do |n|
          text = text + n.to_s + " "
          if text.length > 60
             output = output + text + "\n"
             text = "   "
           end
         end
         output + text + "\n"
    end
  end
  