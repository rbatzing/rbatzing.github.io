OFFICE_NAME = 'GTS Services' 

class Worker
  attr_accessor :name, :status
  @@count = 0

  def initialize(name)
    @name = name
    @status = :out
    @@count += 1
  end

  def signin
    @status = :in
  end
  
  def signout
    @status = :out
  end
  
  def to_s
    "#{@name}:   #{@status}"
  end
    
  def Worker.count
	@@count
  end

end

  

