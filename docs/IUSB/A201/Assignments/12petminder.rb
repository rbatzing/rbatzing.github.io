=begin rdoc
petminder.rb - A program to track whether pets are being fed
and watered

Author R. Batzinger
Copyright (c) 2009 Robert Batzinger. All rights reserved.

Included are the class definitions needed for creating a utility
to keep track of the feed and watering of multiple kinds of pets.

in particular:

Collection -  the master list of pets
Pet - an abstract definition of the nature of pet objects
Horse - subclass of Pet
Cat - subclass of Pet
Dog - subclass of Pet

This example has been developed for CSCI A201
=end

class Pet
    def initialize(name,food,container)
        @name = name
        @food = food
        @container = container
        @last_fed = Time.at(0)
        @last_watered = Time.at(0)
    end

    def feed
        @last_fed = Time.now()
        puts "Feeding #{@name} some #{@food} at #{@last_fed}"
    end

    def water
        @last_watered = Time.now()
        puts "Giving #{@name} water in a #{@food} at #{@last_watered}"
    end

    def name
        @name
    end

    def fed?
        Time.now() - @last_fed  < 24 * 60 * 60
    end

    def watered?
        Time.now() - @last_watered < 24 * 60 * 60
    end
    
    def to_s
          "#{@name} eats #{@food}, drinks from #{@container}, " +
              status
    end

    def status
      if (fed? && watered?)
          "feels content"
      else
       ((fed?)? '' :'needs food, ') +
           ((watered?)? '' :'needs water')
      end
    end

    def maintain
        print "Choose an operation ([F]eed [W]ater [C]heck)"
        op = gets().chomp()
        case op
          when 'C','c'
              puts "#{@name} #{status()}"

          when 'W','w'
              water()

          when 'F','f'
              feed()

          else
              puts "Unknown command"
          end
    end
end

class Horse < Pet
    def initialize(name)
        super(name,'hay','trough')
    end
end

class Dog < Pet
    def initialize(name)
        super(name,'dog food','bowl')
    end
end

class Cat < Pet
    def initialize(name)
        super(name,'cat food','dish')
    end
end

class Collection
    def initialize
        @pets = Hash.new
        puts "Welcome to A201 Pet Minder"
    end

    def list_all
        i = 1
        petlist = @pets.keys.sort
        petlist.each { |key|
            print "#{i.to_s}. #{key} "
            puts "(#{@pets[key].class}) #{@pets[key].status}"
            i += 1
        }
        petlist
    end

    def delete_one
      pet = choose_pet()
      if pet != nil
        @pets.delete(pet)
      end
    end

    def maintain_one
      pet = choose_pet()
      if pet != nil
        @pets[pet].maintain()
      end
    end

    def add_one
        print 'Choose a name:'
        name = gets().chomp()
        if @pets[name] != nil
          puts " Error: There is already a #{@pets[name].class} " +
            "with that name"
          return nil
        end
        print "Choose pet type ([C]at [D]og [H]orse):"
        type = gets().chomp()
        case type
        when 'C','c'
          pet = Cat.new(name)
        when 'D','d'
          pet = Dog.new(name)
        when 'H','h'
          pet = Horse.new(name)
        else
          puts '  Unknown pet type ... cancelling'
          return nil
        end
        @pets[name] = pet
    end

    def choose_pet
        if @pets.size > 1
          list = list_all
          puts "Choose a pet by number"
          p = gets().to_i - 1
          return list[p]
        elsif @pets.size == 1
          return @pets.keys[0]
        else
          return nil
        end
    end

    def manage_list
      choice = ''
      until (choice == 'q') || (choice == 'Q') do
        puts "\nChoose an option by letter: [A]dd a pet " +
               "[D]elete a pet"
        print "  [M]aintain a pet [L]ist pets [Q]uit: "
        choice = gets().chomp!
        case choice
        when 'A','a'
          puts 'Adding a pet'
          add_one()
        when 'D','d'
          puts 'Deleting a pet'
          delete_one()
        when 'M','m'
          puts 'Maintaining a pet'
          maintain_one()
        when 'L','l'
          puts 'Listing all pets'
          list_all()
        when 'Q','q'
          puts 'Quiting'
        else
          puts '  WARNING: Unsupported option'
        end
      end
    end
end

mypets = Collection.new()
mypets.manage_list
puts "... Good-bye"


