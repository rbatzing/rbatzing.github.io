# Automate the testing of the components of the Class PrimeList
class TestPrimeList < Test::Unit::TestCase
  
# Tests the predicate that checks whether a number is prime or not.
   def test_primetest
     x = PrimeList.new(10)
     assert_equal(true, x.is_prime?(7))
     assert_equal(false, x.is_prime?(4))
     assert_equal(true, x.is_prime?(0))
     assert_equal(true, x.is_prime?(1))
   end
   
   # Tests the ability to develop a list of prime numbers
   def test_primelist
     x = PrimeList.new(10)
     assert_equal("Prime numbers (upto 1) : \n",
                 PrimeList.new(1).to_s)
     assert_equal("Prime numbers (upto 1) : \n",
                 PrimeList.new(1).to_s)
     assert_equal("Prime numbers (upto 0) : \n",
                 PrimeList.new(0).to_s)
   end
end
