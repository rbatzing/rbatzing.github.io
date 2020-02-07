class Calculator
  def initialize
     @accumulator = '0'
     @last_accumulator = '0'
     @result = 0.0
     @operation = 'equal'
   end
   
   def update
     if @accumulator == ''
        accum = @last_accumulator.to_f
     else
        accum = @accumulator.to_f
        @last_accumulator = @accumulator
        @accumulator = ''
    end
      
     case @operation
       when "add"
                  @result = @result + accum 
       when "subtract"
                @result = @result - accum
       when "multiply"
                @result = @result * accum
       when "divide"
                @result = @result / accum
       when "mod"
                @result = @result % accum
       when "power"
                @result = @result ** accum
       when "equal"
                @result = accum
       when "clear"
                @result = 0.0
                @last_accumulator = '0'
                @accumulator = '0'
       end
     end
     
       
   def operation(op)
     update()
     if op == "clear"
       @operation = "equal"
     else
       @operation = op
     end
     @result.to_s
   end
   
   def key(val)
     if @accumulator != '0'
        @accumulator = @accumulator + val
     else
       @accumulator = val
     end
   end
   
   def clear
     @result = 0.0
     @operation = 'equal' 
     @accumulator = '0'
   end
   
end
 



Shoes.app (:title => "Shoes Calculator", :width => 240, :height => 210, :resizable => false) {
   background 'C00'..'300'
  calc = Calculator.new
  
	@numberbox = edit_line :width => 200, :top => 10,:left => 20, :height => 50
		@numberbox.text = '0'
    
		@firstline = flow (:margin => 20, :top => 50) {
									@off = button "Off", :width => 50, :height => 30, :curve => 10
									@mod = button "mod", :width => 50, :height => 30, :curve => 10
									@power = button "x^y", :width => 50, :height => 30, :curve => 10
                  @clear = button "C", :width => 50, :height => 30, :curve => 10
                  
									@one = button "1", :width => 50, :height => 30, :curve => 10
									@two = button "2", :width => 50, :height => 30, :curve => 10
									@three = button "3", :width => 50, :height => 30, :curve => 10
									@plus = button "+", :width => 50, :height => 30, :curve => 10

                  @four = button "4", :width => 50, :height => 30, :curve => 10
									@five = button "5", :width => 50, :height => 30, :curve => 10
									@six = button "6", :width => 50, :height => 30, :curve => 10
									@minus = button "-", :width => 50, :height => 30, :curve => 10

                  @seven = button "7", :width => 50, :height => 30, :curve => 10
									@eight = button "8", :width => 50, :height => 30, :curve => 10
									@nine = button "9", :width => 50, :height => 30, :curve => 10
									@multiply = button "x", :width => 50, :height => 30, :curve => 10

									@dot = button ".", :width => 50, :height => 30, :curve => 10
                  @zero = button "0", :width => 50, :height => 30, :curve => 10
									@equals = button "=", :width => 50, :height => 30, :curve => 10
									@divide = button "/", :width => 50, :height => 30, :curve => 10
									
									@zero.click {
										@numberbox.text = calc.key('0')
									}

                  @one.click {
										@numberbox.text = calc.key('1')
									}
								
									@two.click {
										@numberbox.text = calc.key('2')
									}
								
									@three.click {
										@numberbox.text = calc.key('3')
									}
									
									@four.click {
										@numberbox.text = calc.key('4')
									}
									
									@five.click {
										@numberbox.text = calc.key('5')
									}
									
									@six.click {
										@numberbox.text = calc.key('6')
									}
									
									@seven.click {
										@numberbox.text = calc.key('7')
									}
									
									@eight.click {
										@numberbox.text = calc.key('8')
									}
									
									@nine.click {
										@numberbox.text = calc.key('9')
									}
									
									@dot.click {
										@numberbox.text = calc.key('.')
									}
									
									@clear.click {
										@numberbox.text = calc.operation("clear")
									}
									
									@plus.click {
										@numberbox.text = calc.operation("add")
									}
									
									@minus.click {
										@numberbox.text = calc.operation("subtract")
									}
									
									@multiply.click {
										@numberbox.text = calc.operation("multiply")
									}
									
									@divide.click {
										@numberbox.text = calc.operation("divide")
									}
									
									@equals.click {
										@numberbox.text = calc.operation("equal")
									}
                  @mod.click {
										@numberbox.text = calc.operation("mod")
									}
                  @power.click {
										@numberbox.text = calc.operation("power")
									}
                  @off.click {
										 exit()
									}
								}
}