STDIN.each_line {|x|
  puts x
}

__END__

STDIN.each_byte { |x|
   putc x
}
_______________________

STDIN.each_line {|x|
  puts x
}
_______________________
  
STDIN.readlines.each { |x|
   puts x
}
_______________________

while ! STDIN.eof?
   x = getc
   putc x
end
_______________________

while ! STDIN.eof?
   x = gets
   puts x
end
_______________________

myfile = File.open('poem.txt')
myfile.each { |x|
  puts x
}
