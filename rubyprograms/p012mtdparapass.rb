def downer(string)  
    string.downcase  
  end  
  a = "HELLO"  
  downer(a)      # -> "hello"  
  puts a         # -> "HELLO"  
    
  def downer(string)  
    string.downcase!  
  end  
  a = "HELLO"  
  downer(a)      # -> "hello"  
  puts a         # -> "hello" 