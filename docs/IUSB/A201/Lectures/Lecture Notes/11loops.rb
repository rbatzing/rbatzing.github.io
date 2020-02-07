for  i  in  0...5 do
   puts " i = #{i}"
end

5.times do |i|
    puts " i = #{i}"
end

(0...5).each do |i| 
    puts " i = #{i}"
end     

i = 0
loop do
   puts " i = #{i}"
   i += 1
   break if i >= 5
end


i=0
until i == 5 do
    puts " i = #{i}"
    i += 1
end


0.upto(4) do |i|
    puts " i = #{i}"
end


i = 0
while i < 5 do
    puts " i = #{i}"
    i += 1
end   


  
