# == Snopsis
#  Lists all prime numbers up to and equal to a given number
#  Developed for as a sample program in online course.
# == Author
# Robert Batzinger, IU South Bend, Informatics
#
# == Copyright
# Copyright (c) 2009, IU South Bend, Informatics
# All rights reserved.
#
# == Overview
# This is a demonstration of the built-in support for documentation and
# testing of a program. This particular program loads in the class library
# PrimeList which does the main work.

# == Class Library
# require 'primelist'
require 'logger'
require 'primeslist2'

log = Logger.new('primes.log')
log.info('Starting up...')

puts 'Primes - a program to generate a list of prime numbers'
print 'Upper limit to the list of prime numbers desired:'

y = gets.to_i
log.debug("   Working range: 2 to #{y}")

log.info('   Creating a list of prime numbers')
x = PrimeList2.new(y)
puts x
log.info('Primes found:')
log.debug(x)
log.info("...shutting down")
         