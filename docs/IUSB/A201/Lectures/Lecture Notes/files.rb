d = Dir.new('.') 
d.each do |x|
    puts "File: #{x}"
    puts '------------'
    if (File.file?(x))
      f = File.open(x)
      f.each_line do |y|
          puts y
      end
      puts '------------'
      f.close
    end
  end
  