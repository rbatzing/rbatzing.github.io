  # This is an improved version of this class library
  class PrimeList2
  # Make a list of primes upto or equal to the Number n
    def initialize(n)
       @max = n
       @primes = Array.new()
       i = 2
       while i <= n do
       
          # Add all primes to the list
           if is_prime?(i)
              @primes << i
            end
            
           # Work through  possible numbers skipping even numbers (except 2) 
            if i == 2
              i = i + 1
            else
              i = i + 2
            end
        end
     end
      
  # Check if a number is prime      
    def is_prime?(n)
      # Set the limits of the factor search from 2 to SQRT(n)
      m = 2
      m_max = Math.sqrt(n)
      
      # Check if any number is a factor 
      while m <= m_max do
      
            # disqualified if a factor was found
            if (m * (n/m)) == n
              return false
            end
            
           # Work through  possible factors skipping even numbers 
           if m == 2
              m = m + 1
            else
              m = m + 2
            end
      end
      return true
    end
    
  # Show the list of prime numbers found 
    def to_s
       text = "Prime numbers " +
               "(upto " + @max.to_s + 
               ") : " + @primes.join(' ')
               
       # Readjust the line length       
       output = ''
       while text.length > 60 do
          line = text.match(/(.{1,60})\s/)
          output = output + line[1] + "\n"
          text.sub!(/.{1,60}\s/,'   ')
        end
        
      # return the reformatted output  
      output + text + "\n"
    end
end
