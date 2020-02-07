class Vector

# Constructor
     def initialize(x,y)
         @x = x
         @y = y
     end

# Display Format
     def to_s 
           "(#{@x}, #{@y})"
     end

# Accessor  Functions
        def x
               @x 
        end

        def y
               @y
         end

# Setter Functions
       def x=(value)
              @x = value
       end

       def y=(value)
              @y = value
       end
       
# Other methods
      def double_x
              @x + @x
      end

end
